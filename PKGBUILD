# Maintainer: Shwetank Gupta <shwetankg07@gmail.com>
#
# The -git package. Published to the AUR as its own repo (kbrgb-git), where
# this file is committed as PKGBUILD. See RELEASING.md.
pkgname=kbrgb-git
_pkgname=kbrgb
pkgver=0.2.0.r1.g4eec461
pkgrel=1
pkgdesc="RGB keyboard control for Acer Predator/Nitro laptops with the ENE KB5130 (ENEK5130) i2c-HID controller (git)"
arch=('any')
url="https://github.com/shwetankg07/kbrgb"
license=('MIT')
depends=('python')
makedepends=('git')
optdepends=('walker: preset picker used by the bundled kbrgb-menu example')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.0.0.r%s.g%s" \
       "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm755 kbrgb.py "${pkgdir}/usr/bin/kbrgb"

  # Generated from the one copy in kbrgb.py; see the note in the release
  # PKGBUILD. Keeps the packaged rule and `kbrgb install-udev` in lockstep.
  install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
  python3 kbrgb.py install-udev --print \
    > "${pkgdir}/usr/lib/udev/rules.d/60-kbrgb-enek5130.rules"
  chmod 644 "${pkgdir}/usr/lib/udev/rules.d/60-kbrgb-enek5130.rules"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 PROTOCOL.md "${pkgdir}/usr/share/doc/${pkgname}/PROTOCOL.md"

  install -Dm755 examples/kbrgb-menu \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/kbrgb-menu"
  install -Dm644 examples/presets.conf \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/presets.conf"
  install -Dm644 examples/systemd/kbrgb-restore.service \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/systemd/kbrgb-restore.service"
  install -Dm755 examples/omarchy/kbrgb-restore \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/omarchy/kbrgb-restore"
  install -Dm755 examples/omarchy/theme-set \
    "${pkgdir}/usr/share/doc/${pkgname}/examples/omarchy/theme-set"
}
