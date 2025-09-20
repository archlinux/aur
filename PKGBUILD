# Maintainer: Rukkhadevata123 <3083913301@qq.com>
# Contributor: MYT1 <myt1 @ QQ.com>
# Contributor: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=1
pkgdesc="腾讯QQ音乐"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' 'alsa-lib')
provides=("$_pkgname")
sign=1-d1ca4d5c5a8369b26af88e881ba3ac544066a899dcaea29778b35c9f648e6fee-68cb7c1c
source=(
    "qqmusic_${pkgver}_amd64.deb::https://c.y.qq.com/cgi-bin/file_redirect.fcg?bid=dldir&file=ecosfile_plink%2Fmusic_clntupate%2Flinux%2Fother%2Fqqmusic_${pkgver}_amd64.deb&sign=${sign}"
    "$url/i/user_terms.html"
    "${_pkgname}".sh
)
sha512sums=('0da75cddd70340dfb3551af39200b6c90a3b506db539a0276d4a4f50d593f3559dcfa16819a68634ef0b85247d1add1737f699fd24942f1da8915ee867f4b2ee'
            '7ec79376e96b6f3839719e568e8f96c5ec2a3d084ea50538b5ffb15a839b3a1a763460d5b4dce69cbe5d0516cc1305198a58d3fee8ca618430272c102e9617a2'
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
