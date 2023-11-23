# Maintainer: Ryan O'Beirne <ryanobeirne@ryanobeirne.com>
# Helpful url: https://services.lidarr.audio/v1/update/master?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname='lidarr-git'
pkgver=1.0.0
pkgrel=1
pkgdesc="Music download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lidarr/Lidarr'
license=("GPL3")
conflicts=('lidarr' 'lidarr-develop' 'lidarr-nightly')
depends=('sqlite' 'chromaprint')
makedepends=('git' 'yarn' 'dotnet-sdk')
options=('!strip' 'staticlibs')
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'qbittorrent: torrent downloader'
  'qbittorrent-nox: torrent downloader (no X)'
  'jackett: torrent indexer proxy'
  'libgdiplus: provides a gdi+ compatible api'
)

source=(
  'git+https://github.com/lidarr/Lidarr.git'
  'lidarr.service'
  'lidarr.tmpfiles'
  'lidarr.sysusers'
  'package_info'
)

sha512sums=(
  'SKIP'
  '156c1437b4d71858e01c60b5af65c0a52aab4554e3b26c3b5685291e230d93596a756ae4bcc5828238ad265bf066d6ebeea91f0e2c3e1732cdbb5ebdf9517238'
  'e40ce79a3e1741e7e06312797e652a85d199bd6d719ef953ea8c3c030756ee44e202956ac9e13cff17fac38312c27398f457f79923a7d0f56bd563a69af6ab63'
  'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622'
  'cabbd3d6387f4198097573da23032d80c1fec11835c180e55a28ee54c79c821d3c49c039762cc3ddc5126efc37d50d93cdd89a75ff809a3d533533a30353933e'
)

pkgver() {
  printf  "%s.%s" "$pkgver" "$(git rev-parse HEAD | head -c7)"
}

_runtime() {
  case "$CARCH" in
    x86_64)  RUNTIME="linux-x64";;
    aarch64) RUNTIME="linux-arm64";;
    armv7h)  RUNTIME="linux-arm";;
    *) echo "invalid architecture: $CARCH"; return 1;;
  esac
  echo "$RUNTIME"
}

_runtime_srcdir() {
  echo "${srcdir}/Lidarr/_artifacts/$(_runtime)/net6.0/Lidarr"
}

build() {
  RUNTIME="$(_runtime)"
  cd "${srcdir}/Lidarr"
  ./build.sh --frontend --backend --packages --framework "net6.0" --runtime "$RUNTIME"
}

package() {
  RUNTIME="$(_runtime)"

  # Update environment isn't needed.
  rm -rf "$(_runtime_srcdir)/Lidarr.Update"

  # The fpcalc binary comes from chromaprint.
  rm -rf "$(_runtime_srcdir)/fpcalc"

  install -d -m 755 "${pkgdir}/usr/lib/lidarr/bin"
  cp -dpr --no-preserve=ownership "$(_runtime_srcdir)/"* "${pkgdir}/usr/lib/lidarr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/lidarr/bin"
  chmod +x "${pkgdir}/usr/lib/lidarr/bin/Lidarr"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/lidarr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/lidarr/package_info"

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
