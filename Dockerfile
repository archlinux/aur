# T3 Code headless server image — bridge-network, multi-provider proxy design.
#
# The container runs a socat TCP proxy per configured AI provider inside the
# container on fixed ports (4096-opencode, 4097-codex, 4098-claude, 4099-grok).
# T3 Code's settings.json seed hardcodes the loopback addresses of these
# proxies. The PKGBUILD build args determine which providers get spawned at
# container start by passing T3_<PROVIDER>_URL env vars.
#
# This keeps the container image + settings.json byte-identical across all
# instances — only the systemd unit's Environment= and the entrypoint's
# socat targets differ per instance.
#
# Bridge networking: `-p <host>:3773` publishes T3's web UI; socat reaches
# the host's provider servers via host.docker.internal (<-add-host flag).

FROM node:24-slim

# Build toolchain for node-pty native module (may need to compile from source
# if the npm package's prebuilt binary doesn't match). socat for the per-
# provider TCP proxy layer.
RUN apt-get update && apt-get install -y --no-install-recommends \
      python3 make g++ ca-certificates socat \
    && rm -rf /var/lib/apt/lists/*

# Vendored t3 tarball baked in during PKGBUILD build() for reproducibility.
COPY t3.tgz /tmp/t3.tgz

RUN npm install -g --no-audit --no-fund /tmp/t3.tgz \
    && rm /tmp/t3.tgz \
    && npm cache clean --force

# Entrypoint parses T3_*_URL env vars, spawns socat per provider, execs t3.
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV NO_BROWSER=1
EXPOSE 3773

ENTRYPOINT ["/entrypoint.sh"]
