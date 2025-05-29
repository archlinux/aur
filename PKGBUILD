# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-server
pkgver=v5.1.0.dev.88.r3.g50099e21f
pkgrel=1
pkgdesc="An anime cataloging program designed to automate the cataloging of your anime collection regardless of the size and number of files in your collection."
arch=('any')
url="https://shokoanime.com/"
license=('MIT')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')
# backup=('etc/shoko-server/config.json')
install=${pkgname}.install
source=(
  "git+https://github.com/ShokoAnime/ShokoServer.git"
  'shoko-server.service'
  'LICENSE'
)
sha512sums=('SKIP'
            'cab4b39d91d43a4958b7d62da4c5079827d4b15ed50271f0b4901da86cd9f93ff4c2816432e31f639ba3aa28d37a08dc8fee87417e633ee49a6fddc35083af1a'
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
  _output_dir="${pkgdir}/opt/${pkgname}/"
  mkdir -p "${_output_dir}"
  dotnet publish -c=Release -r linux-x64 \
    -f net8.0 -o="${_output_dir}" \
    Shoko.CLI/Shoko.CLI.csproj /p:Version="${_version}" \
    /p:InformationalVersion="\"channel=${_channel},commit=${_commit},tag=${_tag},date=${_date},\""
}

package() {
  mkdir -p "${pkgdir}/etc/${pkgname}" "${pkgdir}/var/log/${pkgname}"
  install -Dm644 'shoko-server.service' "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

