# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster@gmail.com>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.8.2"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__runtime_suffix="-5.1"
__proxy_suffix="-5.1"
__shim_suffix="-5.1"
__ksm_throttler_suffix="-5.1"
__img_suffix="-5.1"
__linux_container_ver="4.19.73.51-5.1"

__runtime_rpm="kata-runtime-${pkgver}${__runtime_suffix}.x86_64.rpm"
__proxy_bin_rpm="kata-proxy-bin-${pkgver}${__proxy_suffix}.x86_64.rpm"
__shim_bin_rpm="kata-shim-bin-${pkgver}${__shim_suffix}.x86_64.rpm"
__ksm_throttler_rpm="kata-ksm-throttler-${pkgver}${__ksm_throttler_suffix}.x86_64.rpm"
__img_rpm="kata-containers-image-${pkgver}${__img_suffix}.x86_64.rpm"
__linux_container_rpm="kata-linux-container-${__linux_container_ver}.x86_64.rpm"

__dlbase="http://download.opensuse.org/repositories/home:/katacontainers:/releases:/x86_64:/stable-1.8/Fedora_30/x86_64"
__runtime_src="${__dlbase}/${__runtime_rpm}"
__proxy_bin_src="${__dlbase}/${__proxy_bin_rpm}"
__shim_bin_src="${__dlbase}/${__shim_bin_rpm}"
__ksm_throttler_src="${__dlbase}/${__ksm_throttler_rpm}"
__img_src="${__dlbase}/${__img_rpm}"
__linux_container_src="${__dlbase}/${__linux_container_rpm}"

source=(
  $__runtime_src
  $__proxy_bin_src
  $__shim_bin_src
  $__ksm_throttler_src
  $__img_src
  $__linux_container_src
)
noextract=(
  $__runtime_rpm
  $__proxy_bin_rpm
  $__shim_bin_rpm
  $__ksm_throttler_rpm
  $__img_rpm
  $__linux_container_rpm
)

sha256sums=('739b8f6079bdf0f3e2ba0496f50f714fb140fd230a3b0956ba4eeb83e0c279b0'
            '4369d7c0832b39389066f89c621fe17cfe9f69eb057fccdcf5ce9b08b4426275'
            '9c5fa95e669a692d5148b474155faf23974db3e1ef1357a214d941c0d7973922'
            'd6ba15fb2e9abcaf44bb52029f0b33526f058485a8a6efcdd089089324e33db1'
            '7ae71646442ab88fec1dbd2123cf9d3a90c05759fbb721eb75111a591efd4dc4'
            'e6b6a10a8951c6b4761f24142b1e7f340ee77c16f614135905de6671b382fa5f')

__extract_into_dir() {
  archive=$1
  dir=$2
  echo Extracting $(basename $archive) into $dir using bsdtar
  bsdtar -C $dir -xf $archive
}

prepare() {
  pushd $srcdir

  mkdir -p {kata-runtime,kata-proxy,kata-shim,kata-ksm-throttler,kata-containers-image,kata-linux-container}-${pkgver}

  __extract_into_dir $__runtime_rpm kata-runtime-${pkgver}
  __extract_into_dir $__proxy_bin_rpm kata-proxy-${pkgver}
  __extract_into_dir $__shim_bin_rpm kata-shim-${pkgver}
  __extract_into_dir $__ksm_throttler_rpm kata-ksm-throttler-${pkgver}
  __extract_into_dir $__img_rpm kata-containers-image-${pkgver}
  __extract_into_dir $__linux_container_rpm kata-linux-container-${pkgver}

  popd
}

package_kata-runtime() {
  depends=(qemu kata-proxy=${pkgver} kata-shim=${pkgver} kata-ksm-throttler=${pkgver} kata-containers-image=${pkgver} kata-linux-container=${pkgver})
  install=kata-runtime.install

  pushd $srcdir/kata-runtime-${pkgver}
  install -D -m 0755 {,$pkgdir/}usr/bin/kata-runtime
  install -D -m 0755 {,$pkgdir/}usr/bin/kata-collect-data.sh
  install -D -m 0644 {,$pkgdir/}usr/share/bash-completion/completions/kata-runtime
  install -D -m 0644 {,$pkgdir/}usr/share/defaults/kata-containers/configuration.toml

  sed -i s/libexec/lib/ $pkgdir/usr/share/defaults/kata-containers/configuration.toml
  sed -i s/qemu-lite/qemu/ $pkgdir/usr/share/defaults/kata-containers/configuration.toml
  popd
}

package_kata-proxy() {
  pushd $srcdir/kata-proxy-${pkgver}
  install -D -m 0755 usr/libexec/kata-containers/kata-proxy $pkgdir/usr/lib/kata-containers/kata-proxy
  popd
}

package_kata-shim() {
  pushd $srcdir/kata-shim-${pkgver}
  install -D -m 0755 usr/libexec/kata-containers/kata-shim $pkgdir/usr/lib/kata-containers/kata-shim
  popd
}

package_kata-ksm-throttler() {
  pushd $srcdir/kata-ksm-throttler-${pkgver}
  install -D -m 0644 {,$pkgdir/}usr/lib/systemd/system/kata-ksm-throttler.service
  install -D -m 0644 {,$pkgdir/}usr/lib/systemd/system/kata-vc-throttler.service
  install -D -m 0755 usr/libexec/kata-ksm-throttler/kata-ksm-throttler $pkgdir/usr/lib/kata-ksm-throttler/kata-ksm-throttler
  install -D -m 0755 usr/libexec/kata-ksm-throttler/trigger/virtcontainers/vc $pkgdir/usr/lib/kata-ksm-throttler/trigger/virtcontainers/vc

  sed -i 's/libexec/lib/' $pkgdir/usr/lib/systemd/system/kata-ksm-throttler.service $pkgdir/usr/lib/systemd/system/kata-vc-throttler.service
  popd
}

package_kata-containers-image() {
  pushd $srcdir/kata-containers-image-${pkgver}
  cp -a usr $pkgdir
  popd
}

package_kata-linux-container() {
  pushd $srcdir/kata-linux-container-${pkgver}
  cp -a usr $pkgdir
  rm -rf $pkgdir/usr/lib
  popd
}
