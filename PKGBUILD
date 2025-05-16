# Maintainer: Kimiblock Moe
# Contributor: sukanka <su975853527[AT]gmail.com>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>

_pkgname=wemeet
pkgname=$_pkgname-bwrap
provides=('wemeet' 'tencent-meeting' "wemeet-wayland-screenshare")
conflicts=('wemeet' 'tencent-meeting' "wemeet-wayland-screenshare")
pkgver=3.19.2.400
_pkgver_arm=3.19.1.401 # 两个版本有时候不一样
_x86_md5=fb7464ffb18b94a06868265bed984007
_arm_md5=206c30da5545dba38a29ccbc752dec94
pkgrel=4
pkgdesc="Sandboxed wemeet, supports screensharing on Wayland / 沙盒化腾讯会议, 支持 Wayland 屏幕共享"
arch=('x86_64' 'aarch64')
license=('LicenseRef-proprietary')
url="https://source.meeting.qq.com/download-center.html"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
)
source_aarch64=("${_pkgname}-${_pkgver_arm}-aarch64.deb::https://updatecdn.meeting.qq.com/cos/${_arm_md5}/TencentMeeting_0300000000_${_pkgver_arm}_arm64_default.publish.deb")
source=("wemeet".sh
	'wrap.c'
	portable-config
	start.sh
	'git+https://github.com/xuwd1/wemeet-wayland-screenshare.git'
	)
depends=(
    "bash"
    "qt5-webengine" "qt5-x11extras" "libxinerama"
    libpulse
    # dependencies detected by namcap
    gcc-libs qt5-declarative libglvnd libxfixes alsa-lib qt5-webchannel openssl
    libxrandr libxext libx11 hicolor-icon-theme glibc zlib libxcomposite
    qt5-base systemd-libs libxdamage qt5-svg
    libyuv
    portable
    wireplumber
    qt5-wayland
    xwaylandvideobridge
    opencv
    libxrandr
    "libportal"
    "xdg-desktop-portal"
    "xdg-desktop-portal-impl"
)
makedepends=('patchelf' 'cmake' 'git')
sha512sums=('9ff99c46adb12f2384310d3ccc51af75c99a21ebf057d95a18cb76937b38b775eb5837217e4e3fa5af61882508e02464f7f5ee12c07baea9f76dbe06fa10f028'
            'f98e9ae5842c05a19ad4f883c8f9d88ef3b64e04b034e7fd8b23ddca81510f0bd38688ad7c63ddf8badaa727a7b599ceede87419e9694c06d7a4b06138b94c15'
            '1f4acb504af7a6c3fdad53ea36c0bbabd3f12cbd20a674539368294f46a3b06722fb355d8b070abe4f07b5dcc8924b869a3418c1e2e314caf9f51b6550b591b1'
            'd7f5298ce768094eaf2931805897144576c208b33ce7b758703ea7e0cdb1e8a5a5ab0dac2b792fb73702343e4a54280017348cf72d889e226eedfe4dc05004c0'
            'SKIP')
sha512sums_x86_64=('175a92d412ee3359f93ad84e9344d4317f04e396e40586cfa1f3a7798adbe69e3f2991a5af5163cd99fbb3ad1b3e6e7c5b016d17d022f86b7c3f54a1274b8238')
sha512sums_aarch64=('d84bb40617edf1a97d0fd3b6674df050d62c7ce19e8aff1230a42d47d1887ca641aec20d732fc1bbdecc233781db0be0c9ce8a412fdb68d28eec59d09228f638')

prepare() {
    cd "$srcdir"
    tar xpf data.tar.xz

    pushd usr/share/applications
    popd

    pushd opt/$_pkgname
    if [ -d 'icons' ]; then
        for res in 16 32 64 128 256; do
            install -dm755 "$srcdir/usr/share/icons/hicolor/${res}x${res}/apps"
            mv "icons/hicolor/${res}x${res}/mimetypes/${_pkgname}app.png" \
                "$srcdir/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}app.png"
        done
    else
        echo 'icons directory not found'
    fi

    # rm bin/qt.conf
    sed -i "s|^Prefix.*|Prefix = /usr/lib/wemeet|" bin/qt.conf
    patchelf --set-rpath '$ORIGIN:/usr/lib/wemeet' bin/wemeetapp
    popd

    pushd opt/$_pkgname/bin

    find modules/ -type f -name '*.so' | xargs -I {} patchelf --set-rpath '$ORIGIN:/usr/lib/wemeet' {}
    popd
    cd "${srcdir}"/wemeet-wayland-screenshare
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}"
    read -ra openssl_args < <(pkgconf --libs openssl)
    read -ra libpulse_args < <(pkgconf --cflags --libs libpulse)
    # Comment out `-D WRAP_FORCE_SINK_HARDWARE` to disable the patch that forces wemeet detects sink as hardware sink
    "${CC:-cc}" $CFLAGS -Wall -Wextra -fPIC -shared "${openssl_args[@]}" "${libpulse_args[@]}" -o libwemeetwrap.so wrap.c -D WRAP_FORCE_SINK_HARDWARE
    cd "${srcdir}"/wemeet-wayland-screenshare
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
	echo 'https://rule.tencent.com/rule/ab9ea528-0bf1-47b3-a8c3-f001b98912e2' >"${srcdir}/LICENSE"
	install -Dm755 \
		"${srcdir}/wemeet-wayland-screenshare/build/libhook.so" \
		"${pkgdir}/usr/lib/wemeet/libhook.so"
	cd "$srcdir"
    cp -r usr "$pkgdir"
    cd opt/$_pkgname

    install -Dm755 "$srcdir/wemeet.sh" "$pkgdir/usr/lib/wemeet/wemeet-x11"
    install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/wemeet"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.tencent.wemeet/config"
    install -Dm644 $_pkgname.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # libbugly is not likely to be necessary
    install -Dm755 lib/lib{desktop_common,ImSDK,nxui*,qt_*,service*,tms_*,ui*,wemeet*,xcast*,xnn*}.so \
        -t "$pkgdir/usr/lib/$_pkgname"
    if [ -f 'lib/libcrbase.so' ]; then
        install -Dm755 lib/libcrbase.so -t "$pkgdir/usr/lib/$_pkgname"
    else
        echo 'lib/libcrbase.so not found'
    fi
    # copy Qt
    cp -r plugins resources "$pkgdir/usr/lib/$_pkgname"
    cp -a lib/lib{Qt,icu}* "$pkgdir/usr/lib/$_pkgname"

    find "$pkgdir/usr/lib/$_pkgname" -type f -name '*.so*' | xargs -I {} patchelf --set-rpath '$ORIGIN:/usr/lib/wemeet' {}

    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r bin "$pkgdir/opt/$_pkgname"
    ln -s raw/xcast.conf "$pkgdir/opt/$_pkgname/bin/xcast.conf"
    install -Dm755 "$srcdir/libwemeetwrap.so" -t "$pkgdir/usr/lib/$_pkgname"
    rm "${pkgdir}/usr/share/applications/wemeetapp.desktop"
    touch "${pkgdir}/usr/share/applications/com.tencent.wemeet.desktop"
    echo '''[Desktop Entry]
Name=Wemeet
Name[zh_CN]=腾讯会议
Exec=/usr/bin/wemeet %u
Icon=wemeet
Type=Application
Terminal=false
Categories=AudioVideo;
Comment=Tencent Meeting Linux Client
Comment[zh_CN]=腾讯会议Linux客户端
Keywords=wemeet;tencent;meeting;
MimeType=x-scheme-handler/wemeet;
Actions=opendir;share;quit;

[Desktop Action opendir]
Name=Open Wemeet Home
Name[zh_CN]=打开数据目录
Exec=/usr/bin/wemeet --actions opendir
Icon=go-home-symbolic

[Desktop Action share]
Name=Share files with Wemeet
Name[zh_CN]=向腾讯会议传输文件
Exec=/usr/bin/wemeet --actions share-files
Icon=insert-image-symbolic

[Desktop Action quit]
Name=Quit Wemeet
Name[zh_CN]=退出腾讯会议
Exec=/usr/bin/wemeet --actions quit
Icon=system-log-out-symbolic''' >"${pkgdir}/usr/share/applications/com.tencent.wemeet.desktop"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/wemeet-bwrap/LICENSE"
}
