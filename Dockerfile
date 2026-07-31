# T3 Code headless server image
#
# Base image: node:24-slim
#   T3 requires Node ^22.16 || ^23.11 || >=24.10.
#   -slim is Debian minimal + Node; small enough while giving us apt for
#   the node-pty native-module toolchain we need.
#
# The t3 npm package ships prebuilt node-pty binaries for common
# arch/node combinations, but the postinstall script gets blocked by
# npm 11's allow-scripts guard. We install build tools so `npm rebuild`
# can compile node-pty from source if the prebuild doesn't match.

FROM node:24-slim

# Build toolchain for node-pty (postinstall may need to compile).
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 make g++ ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Vendored t3 tarball baked in during PKGBUILD build().
# COPYing the tgz keeps the image build fully deterministic given the
# same t3 version.
COPY t3.tgz /tmp/t3.tgz

RUN npm install -g --no-audit --no-fund /tmp/t3.tgz \
    && npm rebuild -g --unsafe-perm 2>&1 || true \
    && rm /tmp/t3.tgz \
    && npm cache clean --force

# No USER directive — the runtime `docker run --user UID:GID` from the
# systemd unit sets the effective identity to match the invoking user,
# which makes the bind-mounted $HOME work without ownership rewrites.

# ENV NO_BROWSER is a T3 hint — belt-and-suspenders with --no-browser.
ENV NO_BROWSER=1

# Port is documentation only. `--network host` bypasses -p mapping;
# the actual bind port comes from `t3 serve --port <N>` in the systemd
# unit's ExecStart.
EXPOSE 3773

# The systemd unit overrides CMD with an explicit `t3 serve …` invocation.
# This default is a sane fallback for `docker run` without extra args.
CMD ["t3", "serve", "--host", "127.0.0.1", "--port", "3773", "--no-browser"]
