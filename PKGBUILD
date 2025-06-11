# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-server
pkgver=v5.1.0.dev.88.r3.g50099e21f
pkgrel=1
pkgdesc='An anime cataloging program designed to automate the cataloging of your anime collection regardless of the size and number of files in your collection.'
arch=('any')
url="https://shokoanime.com/"
license=('MIT')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0' 'rhash' 'avdump3')
makedepends=('dotnet-sdk-8.0')
# backup=('etc/shoko-server/config.json')
install=${pkgname}.install
source=(
  "git+https://github.com/ShokoAnime/ShokoServer.git"
  'shoko-server.service'
  'LICENSE'
)
sha512sums=('SKIP'
            'e9089dafa54773a0d63e76071b16f774cbeff6d9defe9763f3283471d801fb36fa209c9eb507a504712f0b82751191c5bcde4cffa3cb32a4f52a673ab6856ef6'
            'c323e1561eea9fba6e6248cfb07fb0e4c4621ffa8f17e1f0b856405cd1505b04c56b395afffeda651475c259d94cc1f88a77f97573b293154d90ef2eaf0ef0b2')

pkgver() {
  cd "${srcdir}/ShokoServer"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "${srcdir}/ShokoServer"
  # git submodule update --init --recursive
}

build() {
  cd "${srcdir}/ShokoServer"
  _channel='aur'
  _version="$(git describe | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+)-.+(\.[0-9]+).*/\1\2/')"
  _commit=$(git show -s --format=%hash)
  _date=$(git show -s --date='format-local:%Y-%m-%dT%H:%M:%SZ' --format=%cd)
  dotnet publish -c=Release -r linux-x64 \
    -f net8.0 -o="${srcdir}/build" \
    Shoko.CLI/Shoko.CLI.csproj /p:Version="${_version}" \
    /p:InformationalVersion="\"channel=${_channel},commit=${_commit},tag=${_tag},date=${_date},\""

  # mv "${srcdir}/build/webui/index.html" "${srcdir}/build/webui/index.html.initial"
}

package() {
  _path_name='shoko'
  _working_dir=${pkgdir}/var/lib/${_path_name}/.shoko/Shoko.CLI
  install -d "${pkgdir}/etc/${_path_name}" "${pkgdir}/var/"{log,lib}"/${_path_name}" "${pkgdir}/usr/"{bin,lib}
  cp -r "${srcdir}/build/" "${pkgdir}/usr/lib/${_path_name}"
  ln -s "/usr/lib/${_path_name}/Shoko.CLI" "${pkgdir}/usr/bin/shoko-server"
  ln -s "/opt/avdump3/AVDump3CL.dll" "${_working_dir}/AVDump/AVDump3CL.dll"
  ln -s "/usr/lib/${_path_name}/webui/index.html.initial" "${pkgdir}/usr/lib/${_path_name}/webui/index.html"

  install -Dm644 'shoko-server.service' "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_path_name}/LICENSE"
}

