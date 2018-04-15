# Maintainer: Sven Frenzel <aur@frenzel.dk>

# Until there are actual releases, get the most recent nightly build using @binhex fancy curl + regex for ease of use.
# https://ci.appveyor.com/project/lidarr/lidarr/branch/develop/artifacts
# lidarr_url=$(curl -s "https://services.lidarr.audio/v1/update/nightly/changes?os=linux" | grep -P -o -m 1 '(?<=url":")[^"]+' | head -1 )

pkgname="lidarr"
pkgver="0.2.0.361"
_urlhash="47atun6evncrqc3q"
pkgrel=1
pkgdesc="Music downloader for usenet and torrents."
arch=(any)
url="https://github.com/lidarr/Lidarr"
license=("GPL3")
depends=("mono" "libmediainfo" "sqlite")
optdepends=("sabnzbd: usenet downloader"
            "nzbget: usenet downloader"
            "transmission-cli: torrent downloader (CLI and daemon)"
            "transmission-gtk: torrent downloader (GTK+)"
            "transmission-qt: torrent downloader (Qt)"
            "deluge: torrent downloader"
            "rtorrent: torrent downloader"
            "jackett: torrent indexer proxy"
            "libgdiplus: provides a gdi+ compatible api")

source=("https://ci.appveyor.com/api/buildjobs/${_urlhash}/artifacts/Lidarr.develop.${pkgver}.linux.tar.gz"
        "lidarr.service"
        "lidarr.tmpfiles"
        "lidarr.sysusers")

sha512sums=('f5c3bc927755656914e545af45a0acf157b5d39b27054f6e89794694e7827e1c05940910cb4746d1a663c0120e67407bbdc86eb7529ae39a89d92482b8a94c55'
            'a50e9b746bdedd277b42eed88d9a7ea35a5291244e8b44fb5c1535d6e5f626adbc41b1545fd8089f2ec928c6f52d6c5ee78eaee25c89562ae8805e3997ceb564'
            '3b2061210576e435d2496257bd099e3f0bc9bb9bda6442461fe44ac9bbd361f4139762ec6dbc0989b60edb906ba61ff56c369107deac8f564b3beea1be6bb8ed'
            'ffd466960527256d8de1d9887d90d4da87486eff062950c46cbc4fd4af1ef89e7d5c070ef1e649b23a95fbab15651e289fd5bdc6d34649e4a6ecdf2f6da06622')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lidarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Lidarr/"* "${pkgdir}/usr/lib/lidarr"
  find "${pkgdir}/usr/lib/lidarr" -type f -exec chmod 644 "{}" ";"

  install -D -m 644 "${srcdir}/lidarr.service" "${pkgdir}/usr/lib/systemd/system/lidarr.service"
  install -D -m 644 "${srcdir}/lidarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/lidarr.conf"
  install -D -m 644 "${srcdir}/lidarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/lidarr.conf"
}
