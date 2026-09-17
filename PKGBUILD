# Maintainer: Ranadeep Biswas <mail@rnbguy.at>
pkgname=bend-bin
pkgver=2.0.4
pkgrel=1
pkgdesc='Bend programming language'
arch=('any')
license=('Apache-2.0')
depends=('bun')
optdepends=('clang: compile Bend programs to native binaries (clang 14+, 19+ for GPU programs)'
            'cuda: build and run GPU programs on NVIDIA GPUs')
provides=('bend')
source=("bend-${pkgver}.tar.gz::https://bend-lang.com/dl/${pkgver}.tar.gz")
sha256sums=('dff7d7e7b42a4572c79d3084093521d198a93af4684d4a10fe8322c265481734')

# To update: open https://bend-lang.com/dl/latest.json, copy its "ver" into
# the pkgver literal above and its "sha256" into sha256sums, then rebuild.
# Upstream publishes no buildable source, only a versioned release tarball
# (pure TypeScript + C/JS effect snippets) behind a self-updating launcher
# (install.sh). The launcher POSTs telemetry to /ping, rewrites
# ~/.bend/current on every run, and races concurrent invocations, so this
# package skips it: /usr/bin/bend invokes the release directly under the
# system bun. Tarball's main.ts performs no telemetry itself (only
# bend --publish contacts BEND_HUB).

package() {
  # Upstream hardcodes the NVIDIA-default /usr/local/cuda (existence check,
  # -I/-L flags in bend2/main.ts cli_build); Arch's cuda package lives at
  # /opt/cuda. Patch the source, don't ship a /usr/local symlink (that tree
  # is the admin's, not the package manager's).
  sed -i 's|/usr/local/cuda|/opt/cuda|g' bend2/main.ts
  install -dm755 "${pkgdir}/usr/lib/bend"
  cp -a bend2 guide "${pkgdir}/usr/lib/bend/"
  find "${pkgdir}/usr/lib/bend" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/bend" -type f -exec chmod 644 {} +

  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /usr/bin/bun /usr/lib/bend/bend2/main.ts "$@"\n' \
    > "${pkgdir}/usr/bin/bend"
  chmod 755 "${pkgdir}/usr/bin/bend"
}
