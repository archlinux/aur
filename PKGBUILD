# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]

pkgname='osu-lazer-git'
pkgver='2021.129.0.r15.cd8ef5373d'
pkgrel=1
pkgdesc='An open source, free-to-win rhythm game'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ppy/osu'
license=('MIT')
depends=('dotnet-runtime>=5' 'ffmpeg' 'libgl')
makedepends=('git' 'dotnet-sdk>=5')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/ppy/osu.git"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('SKIP'
            'f540fb1fcb010768b8fade9a0d578b4ec9835afa1624bd9f9444fc2f12222f2c'
            '4154f98b615110e8ef34da7f9b6a150786cfca923807a8f9674115913a922be9'
            'd97fd78ceacb419e36b0cd02e03394a0f7ad726f55a36c70fea190899911bd55')


pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "'%s'" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname}"
  rm -rf 'compiled'
  env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" dotnet publish 'osu.Desktop' \
  --no-self-contained --configuration 'Release' \
  --runtime "$(dotnet --info | grep -F 'RID' | cut -d ':' -f 2 | tr -d '[:space:]')" \
  --output 'compiled'
}

package() {
  # Launcher, Desktop entry, MIME
  cd "${srcdir}"
  install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -D -m 644 "${pkgname}.desktop" \
  "${pkgdir}/usr/share/applications/sh.ppy.osu.${pkgname%-git}.desktop"
  install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-git}.xml"

  # Runtime, Libraries
  cd "${srcdir}/${pkgname}/compiled"
  find . -type f -exec \
  install -D -m 644 '{}' "${pkgdir}/usr/lib/${pkgname%-git}/{}" ';'

  # Icon, License
  cd "${srcdir}/$pkgname"
  install -D -m 644 'assets/lazer.png' "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -D -m 644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

