# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=myune_music-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="一个基于 Flutter (Dart) 实现的简洁本地音乐播放器，支持 Windows / Linux 双端。"
arch=('x86_64')
_pkgname=${pkgname%-bin} 
url="https://github.com/xiaobaimc/$_pkgname"
license=('Apache-2.0')
depends=(
  'gtk3'
  'gcc-libs'
  'glibc'
  'libayatana-appindicator'
  'libayatana-indicator'
  'harfbuzz'
  'fontconfig'
  'libepoxy'
  'zlib'
  'ayatana-ido'
  'gdk-pixbuf2'
  'at-spi2-core'
  'cairo'
  'pango'
  'libdbusmenu-glib'
  'glib2'
)
makedepends=('patchelf')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')  # 禁用 debug 包
source=("${_pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/MyuneMusic_v${pkgver}_linux-x64.tar.xz")
sha256sums=('5d8cb4e1b2886f22509b1955408a02ebec6ccbc88b157cb6ee0c9600c146c97c')


package() {

        local _dir="bundle"

        install -dm755 "$pkgdir/usr/bin"
        install -dm755 "$pkgdir/usr/lib/${_pkgname}"

        install -m755 "${_dir}/myune_music" "$pkgdir/usr/lib/${_pkgname}/"
        cp -r "${_dir}/data" "${_dir}/lib" "$pkgdir/usr/lib/${_pkgname}/"

        touch "${_dir}/${_pkgname}.desktop" 
        cat > "${_dir}/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Myune Music
Comment=一个基于 Flutter (Dart) 实现的简洁本地音乐播放器，支持 Windows / Linux 双端。
Comment[zh_CN]=一个基于 Flutter (Dart) 实现的简洁本地音乐播放器，支持 Windows / Linux 双端。
Exec=/usr/bin/myune_music
Icon=myune_music
Terminal=false
Type=Application
Categories=AudioVideo;Player;Music;Utility;
Keywords=音乐;播放器;本地;Flutter;Dart;Audio;Music;Player;
StartupWMClass=myune_music
MimeType=audio/mpeg;audio/flac;audio/wav;audio/ogg;audio/aac;
NoDisplay=false
StartupNotify=true       
EOF

        install -Dm644 "${_dir}/data/flutter_assets/assets/images/icon/logo.png" \
                  "${pkgdir}/usr/share/icons/hicolor/64x64/apps/myune_music.png" 
        install -dm755 "${pkgdir}/usr/share/applications"  
        install -Dm644 "${_dir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

              
        find "$pkgdir"/usr/lib/"$_pkgname"/lib -type f -name "*.so" | while read -r lib; do

                patchelf --set-rpath '$ORIGIN' "$lib"

        done

        patchelf --set-rpath '$ORIGIN/lib' "$pkgdir"/usr/lib/"$_pkgname"/myune_music
        # for lib in "${pkgdir}"/usr/lib/myune_music/lib/*.so
        # do
                # patchelf "${pkgdir}/usr/lib/${_pkgname}/myune_music"  --add-needed "$lib"
        # done
        ln -s "/usr/lib/${_pkgname}/myune_music" "${pkgdir}/usr/bin/myune_music"

}

