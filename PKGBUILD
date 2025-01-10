#Maintainer: Lunatic <lunaticzy9527 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=iflyime
pkgver=2.0.51
pkgrel=3
pkgdesc="XunFei for Linux (iflyime)"
arch=('x86_64')
url="http://srf.xunfei.cn/"
license=("custom AND LGPL-3.0-or-later")
depends=(
        sh
        curl
        fcitx
        gcc-libs
        glibc
        grpc
        hicolor-icon-theme
        # "dtkwidget"
        libx11
        libxtst
        qt5-base
        protobuf
        sqlite
        opencc
        xdg-utils
        zlib
)
makedepends=()
optdepends=()
# install=
options=(!strip !debug)
source_x86_64=(
        "iflyime_${pkgver}_amd64.deb::https://srf.xunfei.cn/sp1/com.iflytek.iflyime_${pkgver}_amd64_kylin_sp1.deb")
# soucre_aarch64=(
#         "iflyime_${pkgver}_arm64.deb::https://srf.xunfei.cn/sp1/com.iflytek.iflyime_${pkgver}_arm64_kylin_sp1.deb")
source=(
        #         "iflyime_${pkgver}_amd64.deb::http://packages.deepin.com/deepin/pool/non-free/i/iflyime/iflyime_${pkgver}_amd64.deb"
        "https://srf.xunfei.cn/linux/help/agreement.html"
)
sha256sums=('13256d2fe7ace56e536b550423ecced93ac5882a297bf7c4b09db189dc383a4a')
sha256sums_x86_64=('12d84d5b50985d42cb50854c7e3d941a559eb650113118940363ecdb9bee6ac0')

package() {
        cd ${srcdir}
        tar -xvf data.tar.gz -C "${pkgdir}"

        mkdir ${pkgdir}/opt/${pkgname}
        chown -R root:root "${pkgdir}"
        install -Dvm644 agreement.html ${pkgdir}/usr/share/licenses/$pkgname/license.html

        cd ${pkgdir}
        rm -rf usr/share/applications

        mv opt/apps/com.iflytek.iflyime/entries/{applications,icons} usr/share
        mv opt/apps/com.iflytek.iflyime/files/{bin,iflyime-qimpanel,res} opt/${pkgname}
        rm -rf opt/apps
        sed -i -e 's|apps/com.iflytek.iflyime/files|iflyime|g' \
                -e 's|/opt/apps/com.iflytek.iflyime/entries|/usr/share|g' usr/share/applications/iflyime-setting-wizard.desktop
        sed -i -e 's|/usr/bin/iflyime-qimpanel|/opt/iflyime/bin/iflyime-qimpanel|g' opt/${pkgname}/bin/iflyime-daemon.sh

        rm -rf usr/lib/x86_64-linux-gnu
        install -dm755 ${pkgdir}/usr/lib/fcitx/
        ln -sf /opt/${pkgname}/bin/libiflyime.so ${pkgdir}/usr/lib/fcitx/fcitx-iflyime.so
        ln -sf /opt/${pkgname}/bin/fcitx-iflyime.conf ${pkgdir}/usr/share/fcitx/addon/fcitx-iflyime.conf
        ln -sf /opt/${pkgname}/bin/fcitx-iflyime.conf ${pkgdir}/usr/share/fcitx/inputmethod/iflyime.conf
        ln -sf /usr/share/icons/hicolor/48x48/apps/iflyime.png ${pkgdir}/usr/share/fcitx/imicon/fcitx-iflyime.png
        ln -sf /usr/share/icons/hicolor/48x48/apps/iflyime.png ${pkgdir}/usr/share/fcitx/imicon/iflyime.png

        install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" <<EOF
#!/bin/sh
[ -d /opt/${pkgname}/bin/ ] && append_path '/opt/${pkgname}/bin/'

export PATH
EOF

        ln -sf /usr/lib/libgrpc++.so ${pkgdir}/usr/lib/libgrpc++.so.1
        ln -sf /usr/lib/libprotobuf.so ${pkgdir}/usr/lib/libprotobuf.so.17
}
