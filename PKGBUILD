# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Xnopyt <billy@xnopyt.info>
# Contributor: Jack Chen <redchenjs at live dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Robosky <fangyuhao0612 at gmail dot com>

pkgname=anbox-image-houdini-magisk-xposed
pkgver=2018.07.19
pkgrel=2
pkgdesc="Android image for running in Anbox, with Houdini, Xposed Framework and Magisk (Bootless)"
arch=('x86_64')
url="https://anbox.io"
license=('custom')
makedepends=('curl' 'lzip' 'squashfs-tools' 'unzip')
optdepends=('anbox: To make use of the image.')
provides=("anbox-image=${pkgver}")
conflicts=('anbox-image')

source=(
    "https://web.archive.org/web/20210607055240if_/https://build.anbox.io/android-images/${pkgver//./\/}/android_amd64.img"
    "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_y.sfs"
    "https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_z.sfs"
    "https://github.com/topjohnwu/Magisk/releases/download/v20.4/Magisk-v20.4.zip"
    "https://github.com/youling257/XposedTools/files/1931996/xposed-x86_64.zip"
    "XposedInstaller_3.1.5.apk::http://web.archive.org/web/20190807034045if_/https://dl.xda-developers.com/4/3/9/3/0/8/2/XposedInstaller_3.1.5.apk?key=vp4YYV_q9R9UXFJdEqPa6w&ts=1565149304"
    "magisk-init-rc.patch"
    "init-magisk.sh"
    "https://xnopyt.info/busybox"
    "media_codecs.xml"
    "media_codecs_google_video.xml"
    "media_codecs_google_audio.xml"
    "media_codecs_google_telephony.xml"
)

noextract=('XposedInstaller_3.1.5.apk')

md5sums=(
    '26874452a6521ec2e37400670d438e33'
    '7ebf618b1af94a02322d9f2d2610090b'
    '5ca37e1629edb7d13b18751b72dc98ad'
    '9503fc692e03d60cb8897ff2753c193f'
    '86ffee229b724a8019cc78c5e221c24f'
    '315362d994986e6584203fca282f4472'
    '52959db8bc730ee3b7ab2cff7d41b299'
    '4720f9c1a7df7cf05cbbeecdd43797e4'
    'bc3143a5e334402261bf0c703db5deac'
    'a638728bc2413d908f5eb44a9f09e947'
    '599598e70060eb74c119cf7dac0ce466'
    '43193761081a04ca18a28d4a6e039950'
    '91f5f3e5c31f8e221ae8f318527dcb83'
)

build () {
    cd "$srcdir"

    # unpack anbox image
    mkdir -p squashfs-root
    rm -rf ./squashfs-root/*
    unsquashfs -f -d ./squashfs-root ./android_amd64.img

    # load houdini_y
    mkdir -p houdini_y
    rm -rf ./houdini_y/*
    unsquashfs -f -d ./houdini_y ./houdini_y.sfs

    mkdir -p ./squashfs-root/system/lib/arm
    cp -r ./houdini_y/* ./squashfs-root/system/lib/arm
    mv ./squashfs-root/system/lib/arm/libhoudini.so ./squashfs-root/system/lib/libhoudini.so

    # load houdini_z
    mkdir -p houdini_z
    rm -rf ./houdini_z/*
    unsquashfs -f -d ./houdini_z ./houdini_z.sfs

    mkdir -p ./squashfs-root/system/lib64/arm64
    cp -r ./houdini_z/* ./squashfs-root/system/lib64/arm64
    mv ./squashfs-root/system/lib64/arm64/libhoudini.so ./squashfs-root/system/lib64/libhoudini.so

    # add houdini parser
    mkdir -p ./squashfs-root/system/etc/binfmt_misc
    echo ':arm_exe:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28::/system/lib/arm/houdini:P' >> ./squashfs-root/system/etc/binfmt_misc/arm_exe
    echo ':arm_dyn:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x28::/system/lib/arm/houdini:P' >> ./squashfs-root/system/etc/binfmt_misc/arm_dyn
    echo ':arm64_exe:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7::/system/lib64/arm64/houdini64:P' >> ./squashfs-root/system/etc/binfmt_misc/arm64_exe
    echo ':arm64_dyn:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\xb7::/system/lib64/arm64/houdini64:P' >> ./squashfs-root/system/etc/binfmt_misc/arm64_dyn

    # add features
    sed -i '/<\/permissions>/d' ./squashfs-root/system/etc/permissions/anbox.xml
    sed -i '/<unavailable-feature name=\"android.hardware.wifi\" \/>/d' ./squashfs-root/system/etc/permissions/anbox.xml
    sed -i '/<unavailable-feature name=\"android.hardware.bluetooth\" \/>/d' ./squashfs-root/system/etc/permissions/anbox.xml

    echo '    <feature name="android.hardware.touchscreen" />
    <feature name="android.hardware.audio.output" />
    <feature name="android.hardware.camera" />
    <feature name="android.hardware.camera.any" />
    <feature name="android.hardware.location" />
    <feature name="android.hardware.location.gps" />
    <feature name="android.hardware.location.network" />
    <feature name="android.hardware.microphone" />
    <feature name="android.hardware.screen.portrait" />
    <feature name="android.hardware.screen.landscape" />
    <feature name="android.hardware.wifi" />
    <feature name="android.hardware.bluetooth" />' >> ./squashfs-root/system/etc/permissions/anbox.xml
    echo '</permissions>' >> ./squashfs-root/system/etc/permissions/anbox.xml

    # set processors
    sed -i '/^ro.product.cpu.abilist=x86_64,x86/ s/$/,arm64-v8a,armeabi-v7a,armeabi/' ./squashfs-root/system/build.prop
    sed -i '/^ro.product.cpu.abilist32=x86/ s/$/,armeabi-v7a,armeabi/' ./squashfs-root/system/build.prop
    sed -i '/^ro.product.cpu.abilist64=x86_64/ s/$/,arm64-v8a/' ./squashfs-root/system/build.prop

    # enable nativebridge
    echo 'persist.sys.nativebridge=1' >> ./squashfs-root/system/build.prop
    sed -i 's/ro.dalvik.vm.native.bridge=0/ro.dalvik.vm.native.bridge=libhoudini.so/' ./squashfs-root/default.prop

    # enable opengles
    echo 'ro.opengles.version=131072' >> ./squashfs-root/system/build.prop

    # install media codecs
    cp media_codec*.xml ./squashfs-root/system/etc/

    # install xposed
    install -Dm 644 ./xposed.prop ./squashfs-root/system/xposed.prop
    install -Dm 644 ./framework/XposedBridge.jar ./squashfs-root/system/framework/XposedBridge.jar
    install -Dm 755 ./bin/app_process32_xposed ./squashfs-root/system/bin/app_process32
    install -Dm 755 ./bin/dex2oat ./squashfs-root/system/bin/dex2oat
    install -Dm 755 ./bin/oatdump ./squashfs-root/system/bin/oatdump
    install -Dm 755 ./bin/patchoat ./squashfs-root/system/bin/patchoat
    install -Dm 644 ./lib/libart.so ./squashfs-root/system/lib/libart.so
    install -Dm 644 ./lib/libart-compiler.so ./squashfs-root/system/lib/libart-compiler.so
    install -Dm 644 ./lib/libsigchain.so ./squashfs-root/system/lib/libsigchain.so
    install -Dm 644 ./lib/libxposed_art.so ./squashfs-root/system/lib/libxposed_art.so
    install -Dm 755 ./bin/app_process64_xposed ./squashfs-root/system/bin/app_process64
    install -Dm 644 ./lib64/libart.so ./squashfs-root/system/lib64/libart.so
    install -Dm 644 ./lib64/libart-compiler.so ./squashfs-root/system/lib64/libart-compiler.so
    install -Dm 644 ./lib64/libart-disassembler.so ./squashfs-root/system/lib64/libart-disassembler.so
    install -Dm 644 ./lib64/libsigchain.so ./squashfs-root/system/lib64/libsigchain.so
    install -Dm 644 ./lib64/libxposed_art.so ./squashfs-root/system/lib64/libxposed_art.so
    
    mkdir -p ./squashfs-root/system/app/XposedInstaller
    chmod 755 ./squashfs-root/system/app/XposedInstaller
    install -Dm 644 XposedInstaller_3.1.5.apk ./squashfs-root/system/app/XposedInstaller/XposedInstaller.apk

    # install magisk
    rm -f ./squashfs-root/system/bin/su
    rm -f ./squashfs-root/system/xbin/su
    rm -f ./squashfs-root/system/sbin/su

    install -Dm 755 ./init-magisk.sh ./squashfs-root/system/bin/init-magisk.sh
    install -Dm 755 ./x86/magiskinit64 ./squashfs-root/sbin/magiskinit
    install -Dm 755 ./busybox ./squashfs-root/busybox
    install -Dm 755 ./common/util_functions.sh ./squashfs-root/util_functions.sh
    install -Dm 755 ./common/boot_patch.sh ./squashfs-root/boot_patch.sh
    install -Dm 755 ./common/addon.d.sh ./squashfs-root/addon.d.sh
    cd "$srcdir"/squashfs-root/sbin
    ln -s magiskinit magisk
    ln -s magiskinit magiskpolicy
    cd "$srcdir"
    patch --forward --strip=1 --input="${srcdir}/magisk-init-rc.patch"
}

package() {
    cd "$srcdir"

    # repack image
    mksquashfs ./squashfs-root ./android.img -noappend -b 131072 -comp xz -Xbcj x86

    install -Dm 644 ./android.img "$pkgdir/var/lib/anbox/android.img"
}
