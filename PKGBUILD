# Maintainer: Mubashshir <ahmubashshir at gmail dot com>
# Inspired by: aur/anbox-image-gapps
# shellcheck shell=bash disable=SC2034,SC2164,SC2154
# from: git

pkgname=anbox-image-nocsd
pkgver=r8.bc49df8d
pkgrel=2
pkgdesc="Android image for running in Anbox, with no-csd patch and Houdini"
arch=('x86_64')
url="https://anbox.io"
license=('custom')
makedepends=('curl' 'lzip' 'squashfs-tools' 'unzip')
provides=('anbox-image')
conflicts=('anbox-image')

_anbox_rel="$(
  curl --config /dev/null -o /dev/null -Ls https://github.com/thdaemon/anbox/releases/latest -w '%{url_effective}\n' \
  | xargs basename
)"
_bromite_release="$(
  curl --config /dev/null -o /dev/null -Ls https://github.com/bromite/bromite/releases/latest -w '%{url_effective}\n' \
  | xargs basename
)"
source=(
  "android_amd64.img::https://github.com/thdaemon/anbox/releases/download/$_anbox_rel/android.img"
  "houdini_y.sfs::https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_y.sfs"
  "houdini_z.sfs::https://github.com/redchenjs/aur-packages/releases/download/anbox-image/houdini_z.sfs"
  "BromiteSystemWebview.apk::https://github.com/bromite/bromite/releases/download/$_bromite_release/x64_SystemWebView.apk"
  "media_codecs.xml"
  "media_codecs_google_video.xml"
  "media_codecs_google_audio.xml"
  "media_codecs_google_telephony.xml"
)
noextract=('BromiteSystemWebview.apk')
md5sums=('6c31bf493856f982da3d7d78b6e23b85'
         '7ebf618b1af94a02322d9f2d2610090b'
         '5ca37e1629edb7d13b18751b72dc98ad'
         '3e1f57dc93b9cd4071fd95d3ee8eadca'
         '360c6d7b14a538c8034b282b0371be9b'
         '2c96f31ead428ee2d1fbd2a65dd6962d'
         '9f0dd33e444d816ab62fe8e8514a0c0e'
         '0a59e1a43891f21a09fe06f18f0f5feb')

pkgver () {
  local _pkgver _sha __sha
  _pkgver=$(( $(echo $pkgver|sed -En 's/r([[:digit:]]+)\..*/\1/p') + 1))
  _sha=$(echo $pkgver|sed -En 's/r[[:digit:]]+\.(.*)/\1/p')
  __sha=$(
    printf '%s\n%s\n' "$_anbox_rel" "$_bromite_release" | \
      sha256sum - | cut -c1-8
  )
  if [ "$_sha" = "$__sha" ];then
    echo "$pkgver"
  else
    echo "r$_pkgver.$__sha"
  fi
}

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
  rm -rv ./squashfs-root/system/app/webview/*
  cp BromiteSystemWebview.apk ./squashfs-root/system/app/webview/webview.apk
}

package() {
  cd "$srcdir"

  # repack image
  mksquashfs ./squashfs-root ./android.img -noappend -b 131072 -comp xz -Xbcj x86

  install -Dm 644 ./android.img "$pkgdir/var/lib/anbox/android.img"
}
