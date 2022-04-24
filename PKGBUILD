# Contributor: Jack Chen <redchenjs@live.com>
# Maintainer : water_clouds <qrz20081004@outlook.com>

pkgname=anbox-image-houdini-cn
pkgver=2018.07.19
pkgrel=5
pkgdesc="Android image for running in Anbox with Houdini"
arch=('x86_64')
url="https://anbox.io/"
license=('GPL')
makedepends=('squashfs-tools' 'aria2')
provides=('anbox-image')
conflicts=('anbox-image')
source=(
  "media_codecs.xml"
  "media_codecs_google_video.xml"
  "media_codecs_google_audio.xml"
  "media_codecs_google_telephony.xml"
)
sha256sums=('12966892c7b52ca6b2175864710e8945fb33324b478d4ceca92d76f245339ee9'
            '876f5f850cbb5ce4f7a9582654ce006888903e6016dd0b8053e61ab0fd993839'
            'c3acd6442046ac4bd949b5c6f18d79f2707b5bdc677fa8e676bd02a88035ac75'
            'd0ebc3f9b6739d22f140e1a3acae6d92874736c89c53f82779e2e754032ed085')

build () {
# Download sources（usage aria2）
aria2c -x16 https://cloudw233.bitbucket.io/android_amd64.img
aria2c -x16 https://cloudw233.bitbucket.io/houdini_y.sfs
aria2c -x16 https://cloudw233.bitbucket.io/houdini_z.sfs
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
}

package() {
  cd "$srcdir"

  # repack image
  mksquashfs ./squashfs-root ./android.img -noappend -b 131072 -comp xz -Xbcj x86

  install -Dm 644 ./android.img "$pkgdir/var/lib/anbox/android.img"
}
