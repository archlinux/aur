# $Id$
# Maintainer: Kaushal M <kshlmster@gmail.com>
# Contributor: zer0def <zer0def@github>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.8.0"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__runtime_suffix="-3.1"
__proxy_suffix="-3.1"
__shim_suffix="-3.1"
__ksm_throttler_suffix="-3.1"
__img_suffix="-3.1"
__linux_container_ver="4.19.52.45-3.1"

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

sha256sums=('fe282716c769e0875698af7f75a0fbfc473bf210acded431232dcda4d79e98a0'
            '75ae12ade1a41a1339d2c53a162bef0fba012fb329d3a1ed7028d6acac0e0163'
            '492e08417c5518abf4e8df4831e392f5ac81284077e67aa479a87741a9f5ef00'
            'ec0057ce60c882bb078e7e661cf3852ddfafdc2d554028e744dd5b8883c43c53'
            'cee937572423401dae7441efd46019fd218e608dd60c7aa5dfdf15bc99b4362c'
            '3200c91d1ae817c23ddc8d1b9123791550a924f80e87ab2423a161572cb0c250')

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
