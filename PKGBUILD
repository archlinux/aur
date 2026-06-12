# Maintainer: Dmitry Mezhnov <dmezhnov@users.noreply.github.com>
# Repackages the prebuilt Linux bundle from GitHub releases; the upstream
# build needs the exact pinned Flutter SDK, so building from source in
# makepkg is intentionally avoided. Rendered and pushed to the AUR by the
# release workflow (see packaging/README.md).
pkgname=knitcalc-bin
pkgver=1.8.30+53
pkgrel=1
pkgdesc="Knitting calculator: gauge conversion, increases/decreases distribution, yarn estimation, project notes with photos"
arch=('x86_64')
url="https://github.com/dmezhnov/knitcalc"
license=('MIT')
depends=('gtk3' 'glibc' 'gcc-libs')
makedepends=('patchelf')
provides=('knitcalc')
conflicts=('knitcalc')
options=('!strip')
source=("knitcalc-linux-x64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/knitcalc-linux-x64-${pkgver}.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/dmezhnov/knitcalc/v${pkgver}/LICENSE")
sha256sums=('7877c4950711b37a205baf269e01a41a121d51d21691bd829362facfe70b6564'
            'bc7ab77d23df1698c15cf2736af95cd9d7ed522ee1671fa81a9b78659ab9761c')

package() {
  # Upstream CI leaves RUNPATHs pointing into the build runner's home; they
  # resolve to nothing at runtime but namcap flags them as insecure.
  for so in lib/libdartjni.so lib/libfile_selector_linux_plugin.so \
            lib/liburl_launcher_linux_plugin.so; do
    patchelf --remove-rpath "$so"
  done

  install -d "${pkgdir}/usr/lib/knitcalc"
  cp -a knitcalc lib data "${pkgdir}/usr/lib/knitcalc/"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/knitcalc/knitcalc "${pkgdir}/usr/bin/knitcalc"

  # The bundled launcher ships with an @EXEC@ placeholder that the upstream
  # per-user install.sh fills in; point it at the system-wide symlink instead.
  sed 's|@EXEC@|/usr/bin/knitcalc|' desktop/io.github.dmezhnov.knitcalc.desktop \
    | install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/applications/io.github.dmezhnov.knitcalc.desktop"

  cp -a desktop/icons "${pkgdir}/usr/share/"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/icons"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
