# Maintainer: Kimiblock Moe
# Contributor: sukanka <su975853527[AT]gmail.com>
# Contributor: Sam L. Yes <samlukeyes123 at gmail dot com>

_pkgname=wemeet
pkgname=$_pkgname-bwrap
depends=(
    "bash"
    "qt5-webengine" "qt5-x11extras" "libxinerama"
    libpulse
    # dependencies detected by namcap
    gcc-libs qt5-declarative libglvnd libxfixes alsa-lib qt5-webchannel openssl
    libxrandr libxext libx11 hicolor-icon-theme glibc zlib libxcomposite
    qt5-base systemd-libs libxdamage qt5-svg
    libyuv
    wireplumber
    qt5-wayland
    opencv
    libxrandr
)
provides=('wemeet' 'tencent-meeting' "wemeet-wayland-screenshare")
conflicts=('wemeet' 'tencent-meeting' "wemeet-wayland-screenshare")
pkgver=3.26.10.400
_pkgver_arm=3.19.1.401 # 两个版本有时候不一样
_x86_md5=9cfd93b10ee81b2fc3ad26357f27ed13
_arm_md5=206c30da5545dba38a29ccbc752dec94
pkgrel=1
pkgdesc="Sandboxed wemeet, supports screensharing on Wayland / 沙盒化腾讯会议, 支持 Wayland 屏幕共享"
arch=('x86_64' 'aarch64')
license=('LicenseRef-proprietary')
url="https://source.meeting.qq.com/download-center.html"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
)
source_aarch64=("${_pkgname}-${_pkgver_arm}-aarch64.deb::https://updatecdn.meeting.qq.com/cos/${_arm_md5}/TencentMeeting_0300000000_${_pkgver_arm}_arm64_default.publish.deb")
source=("wemeet".sh
	portable-config
	start.sh
	'git+https://github.com/xuwd1/wemeet-wayland-screenshare.git'
	)
makedepends=('patchelf' 'cmake' 'git' libportal)
sha512sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	)
sha512sums_x86_64=('SKIP')
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

function build() {
	cd "${srcdir}"/wemeet-wayland-screenshare
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	install -Dm755 \
		"${srcdir}/wemeet-wayland-screenshare/build/libhook.so" \
		"${pkgdir}/usr/lib/wemeet/libhook.so"
	depends+=(portable "libportal" "xdg-desktop-portal" "xdg-desktop-portal-impl")
	echo 'https://rule.tencent.com/rule/ab9ea528-0bf1-47b3-a8c3-f001b98912e2' >"${srcdir}/LICENSE"
	cd "$srcdir"
    cp -r usr "$pkgdir"
    cd opt/$_pkgname

    install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/wemeet"
    install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.tencent.wemeet/config"
    install -Dm644 $_pkgname.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # libbugly is not likely to be necessary
	cp -r lib \
		"$pkgdir/usr/lib/$_pkgname"
	install -vDm755 "$srcdir/wemeet.sh" "$pkgdir/usr/lib/wemeet/wemeet-x11"
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
