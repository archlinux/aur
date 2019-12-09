# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=anbox-image-gapps-rooted
pkgver=2018.07.19
pkgrel=6
pkgdesc="Android image for running in Anbox with Houdini, OpenGApps and SuperSU"
arch=('x86_64')
url="https://anbox.io/"
license=('custom')
makedepends=(
    'curl'
    'lzip'
    'unzip'
    'squashfs-tools'
)
provides=(
    'anbox-image'
)
conflicts=(
    'anbox-image'
)
_gapps_rel="$(curl -s -L https://api.github.com/repos/opengapps/x86_64/releases/latest | head -n 10 | grep tag_name | sed -r 's/.*\"([0-9]+)\".*/\1/')"
_gapps_src="https://downloads.sourceforge.net/project/opengapps/x86_64/$_gapps_rel/open_gapps-x86_64-7.1-pico-$_gapps_rel.zip"
_gapps_md5="$(curl -s -L $_gapps_src.md5 | sed -r 's/^([0-9a-z]+).*/\1/')"
_gapps_list=(
    'gsfcore-all'
    'gsflogin-all'
    'gmscore-x86_64'
    'vending-x86_64'
)
source=(
    "http://build.anbox.io/android-images/${pkgver//./\/}/android_amd64.img"
    "houdini_y.sfs::http://dl.android-x86.org/houdini/7_y/houdini.sfs"
    "houdini_z.sfs::http://dl.android-x86.org/houdini/7_z/houdini.sfs"
    "http://supersuroot.org/downloads/SuperSU-v2.82-201705271822.zip"
    "media_codecs.xml"
    "media_codecs_google_video.xml"
    "media_codecs_google_audio.xml"
    "media_codecs_google_telephony.xml"
    "$_gapps_src"
)
md5sums=(
    '26874452a6521ec2e37400670d438e33'
    '7ebf618b1af94a02322d9f2d2610090b'
    '5ca37e1629edb7d13b18751b72dc98ad'
    '8755c94775431f20bd8de368a2c7a179'
    'a638728bc2413d908f5eb44a9f09e947'
    '599598e70060eb74c119cf7dac0ce466'
    '43193761081a04ca18a28d4a6e039950'
    '91f5f3e5c31f8e221ae8f318527dcb83'
    "$_gapps_md5"
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

    # install supersu
    rm -f ./squashfs-root/system/bin/su
    rm -f ./squashfs-root/system/xbin/su
    rm -f ./squashfs-root/system/sbin/su

    mkdir -p ./squashfs-root/system/bin/.ext
    chmod 777 ./squashfs-root/system/bin/.ext
    install -Dm 755 ./x64/su ./squashfs-root/system/bin/.ext/.su
    install -Dm 755 ./x64/su ./squashfs-root/system/xbin/su
    install -Dm 755 ./x64/su ./squashfs-root/system/xbin/daemonsu
    install -Dm 755 ./x64/supolicy ./squashfs-root/system/xbin/supolicy
    install -Dm 644 ./x64/libsupol.so ./squashfs-root/system/lib64/libsupol.so

    mkdir -p ./squashfs-root/system/app/SuperSU
    chmod 755 ./squashfs-root/system/app/SuperSU
    install -Dm 644 ./common/Superuser.apk ./squashfs-root/system/app/SuperSU/Superuser.apk

    rm ./squashfs-root/system/bin/app_process
    ln -s /system/xbin/daemonsu ./squashfs-root/system/bin/app_process
    mv ./squashfs-root/system/bin/app_process64 ./squashfs-root/system/bin/app_process64_original
    ln -s /system/xbin/daemonsu ./squashfs-root/system/bin/app_process64
    cp  ./squashfs-root/system/bin/app_process64_original ./squashfs-root/system/bin/app_process_init

    chmod +w ./squashfs-root/system/etc/init.goldfish.sh
    echo '/system/xbin/daemonsu --auto-daemon &' >> ./squashfs-root/system/etc/init.goldfish.sh
    chmod -w ./squashfs-root/system/etc/init.goldfish.sh
    echo 1 > ./squashfs-root/system/etc/.installed_su_daemon

    # install media codecs
    cp media_codec*.xml ./squashfs-root/system/etc/

    # install gapps
    for i in ${_gapps_list[*]}; do
        mkdir -p $i
        rm -rf ./$i/*
        tar --lzip -xvf ./Core/$i.tar.lz
        cp -r ./$i/nodpi/priv-app/* ./squashfs-root/system/priv-app/
    done
}

package() {
    cd "$srcdir"

    # repack image
    mksquashfs ./squashfs-root ./android.img -noappend -b 131072 -comp xz -Xbcj x86

    install -Dm 644 ./android.img "$pkgdir/var/lib/anbox/android.img"
}
