# Maintainer: MYT1 <myt1 @ QQ.com>
# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.7
pkgrel=1
pkgdesc="腾讯QQ音乐"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3')
provides=("$_pkgname")
source=(
    "qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/qqmusic_${pkgver}_amd64.deb"
    "$url/i/user_terms.html"
    "${_pkgname}".sh
)
sha512sums=('32ca33965e13b7e7faae9e49c8c4d02ae6cf293e53f4842fb2f08237f0423bbbf3bc243eb00f12a2dbff99623fc12bbcaa598f285acb3f97a656d8623d16ddda'
            'b15967bed900ff42ff3db035296fc4cea01a27574418ef6fd1be02c3dbca57c0c641caf6e178da4441613422be48d233223e05630dcf24c825f0c4d1857c734c'
            'bd04c44159d1cdbf1a248e919802c8459a859ac29f4e3a94c04d1b32e1677fd5c0bb068a2d69778a966936d500c9e66e76ac2c435bfadff67a96ea859f1f18c2')

package(){
    cd "${srcdir}"
    install -Dm644 ${srcdir}/user_terms.html "${pkgdir}/usr/share/licenses/${pkgname}/user_terms.html"
    tar -xvf data.tar.xz -C "${pkgdir}"

    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"

    local desktopfile="${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i '3c Exec=qqmusic %U' "$desktopfile"
    sed -i 'N;2aName[zh_CN]=QQ音乐\nKeywords=qqmusic' "$desktopfile"
    sed -i '$a\MimeType=application\/x-ogg;application\/oog;audio\/x-vorbis+ogg;audio\/vorbis;audio\/x-vorbis;audio\/x-scpls;audio\/x-mp3;audio\/x-mpeg;audio\/x-mpegurl;audio\/x-flac;audio\/x-mp4;audio\/x-stm;audio\/x-xm;' "${pkgdir}/usr/share/applications/qqmusic.desktop"
    sed '4s/.*/Keywords=Audio;Song;MP3;CD;Podcast;MTP;iPod;Playlist;Last.fm;UPnP;DLNA;Radio;/g' -i "${pkgdir}/usr/share/applications/qqmusic.desktop"

    # Hex patch
    # 1. Fix orphaned processes
    # 2. Fix search
    local _subst="
        s|\xA4\x8B\x7A\xB9\x8D\xCF\x54\xAE|\xA4\x8B\x7A\xB9\x85\xEF\x54\xAE|
        s|\xB3\x1D\xF5\xCB\x24\xBC|\xA3\x63\xBB\xC9\x3F\xBC|
    "
    sed "$_subst" -i "${pkgdir}/opt/qqmusic/resources/app.asar"

    chmod g-w -R "${pkgdir}" # Fix directory permissions
}
