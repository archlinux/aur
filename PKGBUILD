# Maintainer: Aleksandr Ryzhkov <nietonchique@users.noreply.github.com>
# Prebuilt binary from the GitHub release tarball produced by
# .github/workflows/release.yml. For a source build see the -git variant.
_pkgname=aoostar-lcd
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Glanceable front-panel status display for the AOOSTAR WTR MAX home server'
arch=('x86_64')
url='https://github.com/nietonchique/aoostar-lcd'
license=('MIT' 'Apache')
depends=('glibc' 'gcc-libs' 'systemd-libs')
optdepends=('smartmontools: disk temperatures and SMART health data'
            'zfs-utils: ZFS pool usage page'
            'nvidia-utils: GPU telemetry via nvidia-smi'
            'docker: container CPU/RAM statistics')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/aoostar-lcd.toml')
# The `name::url` form keeps a version+arch-unique local filename in the
# makepkg cache. Checksum below must be updated from the release's
# SHA256SUMS.txt asset (or `updpkgsums`) on every version bump.
source=("${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7713875728ac44bbbc7cadb6f57e793d9dfc2883bb9557f0eb02f42c7aaad1ee')

# No build(): nothing to compile, no makedepends. The tarball carries a
# top-level dir that makepkg extracts into $srcdir automatically.
package() {
  cd "${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"

  install -Dm755 aoostar-lcd       "${pkgdir}/usr/bin/aoostar-lcd"
  install -Dm644 aoostar-lcd.service "${pkgdir}/usr/lib/systemd/system/aoostar-lcd.service"
  # pacman protects /etc: modified files are kept on upgrade, the new one
  # lands as /etc/aoostar-lcd.toml.pacnew (declared via backup=()).
  install -Dm644 config.example.toml "${pkgdir}/etc/aoostar-lcd.toml"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE-MIT    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
