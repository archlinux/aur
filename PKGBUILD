# Maintainer: LY <ly-niko@qq.com>

pkgname=foxit-pdf-editor
pkgver=12.3.3.0409
pkgrel=4
pkgdesc="Foxit PDF Editor"
arch=('x86_64')
url="https://developer.android.com/"
license=('custom')
makedepends=('patchelf')
depends=('openssl-1.1' 'icu66-bin' 'libvpx1.10' 'libwebp' 'libxml2-legacy')
options=('!strip')
source=('foxit-pdf-editor'
        'foxit-linux-login.js')
sha256sums=('c04f8252a7bccaca174da9afb27d7622029f4dc192ff264520833a8eccff05c5'
            '1abc0c476d9a4f5e71f84085f95544a3d1550c681350533c52803c6c0d161565')

_get_auth_url() {
    # bash rewrite of the js function from https://cn.fuxinsoft.cn/pdf-editor-linux/
    local url="$1"
    if [[ "$url" != *cdn07* ]]; then
        echo "$url"
        return
    fi
    local key='AMkb2Dqx'
    local path="/${url#*//*/}"
    local time=$(date +%s)
    local md5=$(echo -n "${path}${key}${time}" | md5sum | cut -d' ' -f1)
    echo "${url}?time=${time}&key=${md5}"
}

prepare() {
    local url="https://cdn07.foxitsoftware.cn/pub/foxit/phantomPDF/desktop/linux/12.x/12.3/signed_com.foxit.foxitpdfeditor_12.3.3.0409_amd64_kylin.deb"
    url=$(_get_auth_url "$url")
    /usr/bin/curl -o out.deb "$url"
    # verify sha256sum
    echo "83b3f29c983ce1b456cbf23d92199ddd60aeac596c8b32bef70677a9c13f7f22  out.deb" | sha256sum -c -
    # unpack
    ar x out.deb
}

package() {
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  
  patchelf --replace-needed libwebp.so.6 libwebp.so "${pkgdir}/opt/apps/com.foxit.foxitpdfeditor/files/lib/libQt5WebEngineCore.so.5"

  # use custom launcher script
  install -Dm755 "${srcdir}/foxit-pdf-editor" -t "${pkgdir}/usr/bin/"
  # frida script for signing in 
  install -Dm644 "${srcdir}/foxit-linux-login.js" -t "${pkgdir}/opt/apps/com.foxit.foxitpdfeditor/files/"
  # update desktop files
  sed -i "s|Exec=/opt/apps/com.foxit.foxitpdfeditor/files/FoxitPDFEditor.sh|Exec=foxit-pdf-editor|g" "${pkgdir}/usr/share/applications/com.foxit.foxitpdfeditor.desktop"
  cp --update=all "${pkgdir}/usr/share/applications/com.foxit.foxitpdfeditor.desktop" "${pkgdir}/opt/apps/com.foxit.foxitpdfeditor/entries/applications/com.foxit.foxitpdfeditor.desktop"

  # there are some other useless stuff in postinst (e.g. register *.pdf as "FoxitReader Document"), so we simply ignore it.
}
