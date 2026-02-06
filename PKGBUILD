# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-server-bin
pkgver=5.3.0
pkgrel=1
pkgdesc='An anime cataloging program designed to automate the cataloging of your anime collection regardless of the size and number of files in your collection.'
arch=('x86_64')
url="https://shokoanime.com/"
license=('MIT')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0' 'rhash' 'avdump3')
# backup=('etc/shoko-server/config.json')
optdepends=(
  'shoko-webui: web-admin ui in latest release'
)
optdepends=(
  'shoko-webui: web-admin ui in latest release'
  'shoko-webui-git: web-admin ui in latest commit (should use this for best compatibility)'
)
provides=('shoko-server')
conflicts=('shoko-server')
install=${pkgname}.install
source=(
  "Shoko.CLI_Framework_any-x64-v${pkgver}.zip::https://github.com/ShokoAnime/ShokoServer/releases/download/v${pkgver}/Shoko.CLI_Framework_any-x64.zip"
  'shoko-server.service'
  'LICENSE'
)
sha512sums=('898aa7ee014ca95cf2f961031d1be35959a8b1e0d51dc3f201456a9237701f794fb5958bc6050b171b14db4746c1b02235edfc87ef5ed38cf0c8bf49c93f7707'
            'e9089dafa54773a0d63e76071b16f774cbeff6d9defe9763f3283471d801fb36fa209c9eb507a504712f0b82751191c5bcde4cffa3cb32a4f52a673ab6856ef6'
            'c323e1561eea9fba6e6248cfb07fb0e4c4621ffa8f17e1f0b856405cd1505b04c56b395afffeda651475c259d94cc1f88a77f97573b293154d90ef2eaf0ef0b2')

prepare() {
  mv "${srcdir}/net8.0/linux-x64/webui/index.html" "${srcdir}/net8.0/linux-x64/webui/index.html.emptytips"
}

package() {
  _path_name='shoko'
  _working_dir=${pkgdir}/var/lib/${_path_name}/.shoko/Shoko.CLI
  install -d "${pkgdir}/etc/${_path_name}" "${pkgdir}/var/"{log,lib}"/${_path_name}" "${pkgdir}/usr/"{bin,lib}
  cp -r "${srcdir}/net8.0/linux-x64/" "${pkgdir}/usr/lib/${_path_name}"
  chmod +x "${pkgdir}/usr/lib/${_path_name}/Shoko.CLI"
  ln -s "/usr/lib/${_path_name}/Shoko.CLI" "${pkgdir}/usr/bin/shoko-server"
  # ln -s "/opt/avdump3/AVDump3CL.dll" "${_working_dir}/AVDump/AVDump3CL.dll"
  ln -s "/usr/lib/${_path_name}/webui/index.html.emptytips" "${pkgdir}/usr/lib/${_path_name}/webui/index.html"

  install -Dm644 'shoko-server.service' "${pkgdir}/usr/lib/systemd/system/shoko-server.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_path_name}/LICENSE"
}

