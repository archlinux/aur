# Maintainer: Merlin Glander <merlin@merlin-glander.de>

pkgname=pidscope-git
_pkgname=pidscope
pkgver=26.06.0.rc1.r0.g992a12c
pkgrel=2
pkgdesc='GNU Octave graphical blackbox flight log analyzer for FPV drone PID tuning'
arch=('x86_64' 'aarch64')
url='https://github.com/dzikus/PIDscope'
license=('GPL-3.0-or-later')
depends=(
  'gnu-free-fonts'
  'octave'
  'octave-control'
  'octave-image'
  'octave-signal'
  'octave-statistics'
)
makedepends=('git')
optdepends=(
  'xdg-utils: open support/project links from the UI'
)
provides=('pidscope')
conflicts=('pidscope'
           'pidscope-bin')
source=(
  'pidscope::git+https://github.com/dzikus/PIDscope.git#branch=pidscope'
  'betaflight-blackbox-tools::git+https://github.com/betaflight/blackbox-tools.git'
  'inav-blackbox-tools::git+https://github.com/iNavFlight/blackbox-tools.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/pidscope"

  git describe --tags --long --abbrev=7 2>/dev/null \
    | sed -E 's/^v//;s/-([0-9]+)-g/.r\1.g/;s/-/./g'
}

build() {
  make -C "${srcdir}/betaflight-blackbox-tools" obj/blackbox_decode
  make -C "${srcdir}/inav-blackbox-tools" obj/blackbox_decode
}

package() {
  cd "${srcdir}/pidscope"

  install -dm755 "${pkgdir}/usr/share/pidscope"
  install -dm755 "${pkgdir}/usr/bin"

  # Provide FreeSans font paths expected by PIDscope/Octave.
  # The actual font files are provided by the gnu-free-fonts dependency.
  install -dm755 "${pkgdir}/usr/share/fonts/opentype/freefont"

  local font
  for font in \
    FreeSans.otf \
    FreeSansBold.otf \
    FreeSansOblique.otf \
    FreeSansBoldOblique.otf
  do
    ln -s "/usr/share/fonts/gnu-free/${font}" \
      "${pkgdir}/usr/share/fonts/opentype/freefont/${font}"
  done

  install -m644 PIDscope.m VERSION "${pkgdir}/usr/share/pidscope/"
  cp -a src "${pkgdir}/usr/share/pidscope/"

  find "${pkgdir}/usr/share/pidscope/src" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/pidscope/src" -type f -exec chmod 644 {} +

  install -m755 \
    "${srcdir}/betaflight-blackbox-tools/obj/blackbox_decode" \
    "${pkgdir}/usr/share/pidscope/blackbox_decode"

  install -m755 \
    "${srcdir}/inav-blackbox-tools/obj/blackbox_decode" \
    "${pkgdir}/usr/share/pidscope/blackbox_decode_INAV"

  cat > "${pkgdir}/usr/bin/pidscope" <<'EOF'
#!/bin/sh
exec octave --gui --persist --eval "cd('/usr/share/pidscope'); PIDscope"
EOF
  chmod 755 "${pkgdir}/usr/bin/pidscope"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 packaging/pidscope.desktop \
    "${pkgdir}/usr/share/applications/com.pidscope.PIDscope.desktop"

  install -Dm644 packaging/com.pidscope.PIDscope.appdata.xml \
    "${pkgdir}/usr/share/metainfo/com.pidscope.PIDscope.appdata.xml"

  install -Dm644 packaging/com.pidscope.PIDscope.mime.xml \
    "${pkgdir}/usr/share/mime/packages/com.pidscope.PIDscope.mime.xml"

  install -Dm644 packaging/com.pidscope.PIDscope-64.png \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/com.pidscope.PIDscope.png"

  install -Dm644 packaging/com.pidscope.PIDscope-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.pidscope.PIDscope.png"
}
