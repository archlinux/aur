# $Id$
# Maintainer: Kaushal M <kshlmster@gmail.com>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.5.0"
pkgrel=1
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__runtime_suffix="+git.5f7fcd7-24.1"
__proxy_suffix="+git.9e77a0b-16.1"
__shim_suffix="+git.efbf3bb-14.1"
__ksm_throttler_suffix=".git+3dd4c9f-18.1"
__img_suffix="-15.1"
__linux_container_ver="4.14.67.22-18.1"

__runtime_rpm="kata-runtime-${pkgver}${__runtime_suffix}.x86_64.rpm"
__proxy_bin_rpm="kata-proxy-bin-${pkgver}${__proxy_suffix}.x86_64.rpm"
__shim_bin_rpm="kata-shim-bin-${pkgver}${__shim_suffix}.x86_64.rpm"
__ksm_throttler_rpm="kata-ksm-throttler-${pkgver}${__ksm_throttler_suffix}.x86_64.rpm"
__img_rpm="kata-containers-image-${pkgver}${__img_suffix}.x86_64.rpm"
__linux_container_rpm="kata-linux-container-${__linux_container_ver}.x86_64.rpm"

__dlbase="http://download.opensuse.org/repositories/home:/katacontainers:/releases:/x86_64:/master/Fedora_29/x86_64/"
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

sha256sums=('4748f684761796baaca983d8cd70c93652af27d5f477b78e8c23b2e9df051f0e'
            '7e4d96b98d95e075c529730b9fe2c9f8d1244d1b7c6b81a239710c8dd3569daa'
            '2e3d4295dcae7fc608b1dbfa4455002c25ced799f54763a6724890ffd7b67038'
            'e7899a9683d38c0e633accaf27d1447352e43d0e42fec156b0c49e9bcc3e527a'
            'd414636f56ea41f2df4ce10c21d08e9186731606169b832743b1ed8b365a4676'
            '743ff71bea107282fd778819c090f2f540df311ba4bcb120e8415771272401d7')

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
