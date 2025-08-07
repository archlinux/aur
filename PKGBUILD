# Maintainer: Kimiblock Moe

# Original PKGBUILD from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=netease-cloud-music

# Maintainer: kXuan <kxuanobj at gmail dot com>
# Contribuor: Peter Cai <peter at typeblog dot net>

pkgname=netease-cloud-music-portable
pkgver=1.2.1
_pkgdate=20190428
pkgrel=9
pkgdesc="Netease Cloud Music, sandboxed by Portable."
arch=("x86_64")
url="https://music.163.com"
provides=(netease-cloud-music)
conflicts=(netease-cloud-music)
license=('custom')
depends=('gtk2' 'gtk3' 'libvlc' 'taglib1' "vlc")
makedepends=(gcc desktop-file-utils sed)
source=(
	"https://d1.music.126.net/dmusic/netease-cloud-music_${pkgver}_amd64_ubuntu_${_pkgdate}.deb"
	"https://music.163.com/html/web2/service.html"
    "patch.c"
    "exclude.list"
    "netease-cloud-music.bash"
    "portable-config"
)
sha256sums=('1ee9f02842e6c2c8c79c48b2e932074f9c213a8eb4238e5e63f20438562fecbb'
            'ea2a9012e8b86ca5946a43f677f64f951f24984dfec523918bfef5eb9e4f0204'
            '27bfe871df38048dbf164dff966b38ff46654663489443ca5e2c47e2bbc6cc43'
            '770c8faed52f67d272b061cec36fed219e1479767a97ed58f2496a948d8178c3'
            '080a6771e74624f589ee2e0196f7e4fad741cfc048f668f47bc8621560b9dac5'
            'f041f1256cf363a513927ff6f760fde458fd885d5cba8cd9a7fb4cfeb2471d18')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

build() {
  cd ${srcdir}
  cc -O2 -fPIC -shared -I /usr/include/vlc/plugins/ -o libnetease-patch.so patch.c
  ln -s /usr/lib/libtag.so.1 libtag.so.2
}

package() {
  cd ${srcdir}
  tar -xf data.tar.xz -C ${pkgdir} --exclude-from=exclude.list
  install -D -m644 service.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
  install -D -m755 libnetease-patch.so ${pkgdir}/opt/netease/netease-cloud-music/libnetease-patch.so
  install -D -m755 netease-cloud-music.bash ${pkgdir}/opt/netease/netease-cloud-music/netease-cloud-music.bash
  install -D -m755 libtag.so.2 ${pkgdir}/opt/netease/netease-cloud-music/libs/libtag.so.2
  install -d "${pkgdir}/opt/netease/netease-cloud-music/overlay"
  rm -r "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/applications"
  echo '''[Desktop Entry]
Version=1.0
Type=Application
Name=NetEase Cloud Music
Name[zh_CN]=网易云音乐
Name[zh_TW]=網易雲音樂
Comment=NetEase Cloud Music
Comment[zh_CN]=网易云音乐
Comment[zh_TW]=網易雲音樂
Icon=netease-cloud-music
Exec=env _portableConfig=com.netease.CloudMusic portable -- %U
Categories=AudioVideo;Player;
Terminal=false
StartupNotify=true
StartupWMClass=netease-cloud-music
''' >"${pkgdir}/usr/share/applications"/com.netease.CloudMusic.desktop
  install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.netease.CloudMusic/config"
  rm -rf "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/bin/"
  echo '''#!/usr/bin/bash
  export _portableConfig=com.netease.CloudMusic
  exec portable -- $@''' >"${pkgdir}/usr/bin/netease-cloud-music"
  chmod 755 "${pkgdir}/usr/bin/netease-cloud-music"
  echo '''[Desktop Entry]
Type=Application
Name=NetEase Cloud Music
Name[zh_CN]=网易云音乐
Name[zh_TW]=網易雲音樂
GenericName=Stub for MPRIS
Icon=netease-cloud-music
TryExec=portable
Exec=env _portableConfig=com.netease.CloudMusic portable -- %U
Terminal=false
NoDisplay=true''' >"${pkgdir}/usr/share/applications/netease-cloud-music.desktop"
}

