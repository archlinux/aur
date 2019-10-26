# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster@gmail.com>

pkgbase=kata-containers
pkgname=(kata-runtime kata-proxy kata-shim kata-ksm-throttler kata-containers-image kata-linux-container)
pkgver="1.9.0"
pkgrel=2
pkgdesc="Lightweight virtual machines for containers"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

__runtime_suffix="-3.1"
__proxy_suffix="-3.1"
__shim_suffix="-3.1"
__ksm_throttler_suffix="-3.1"
__img_suffix="-3.1"
__linux_container_ver="4.19.75.54-3.1"

__runtime_rpm="kata-runtime-${pkgver}${__runtime_suffix}.x86_64.rpm"
__proxy_bin_rpm="kata-proxy-bin-${pkgver}${__proxy_suffix}.x86_64.rpm"
__shim_bin_rpm="kata-shim-bin-${pkgver}${__shim_suffix}.x86_64.rpm"
__ksm_throttler_rpm="kata-ksm-throttler-${pkgver}${__ksm_throttler_suffix}.x86_64.rpm"
__img_rpm="kata-containers-image-${pkgver}${__img_suffix}.x86_64.rpm"
__linux_container_rpm="kata-linux-container-${__linux_container_ver}.x86_64.rpm"

__dlbase="http://download.opensuse.org/repositories/home:/katacontainers:/releases:/x86_64:/stable-1.9/Fedora_30/x86_64"
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

sha256sums=('b6750d23fec54ea24204141284698fa6309fed2644ce8116f61af52c01911b3a'
            'c41ecda5c79afca4ade9e36dc8f7567fb02312a37c38056b35fccfcfb6f1ed25'
            'ba5304e7b0c021cb0cb953c19c727f1d8f33f911eae99ce943b75540083514ef'
            '7078dba4978e216c2cf4f9ecfc2996af4fb56ba40486ddc0baf4a2d3eed50cf9'
            'd30d77a3c2925fb12444460bf797d8619210776557969d9aeb5a4974c4936df3'
            '6570414b7c99920d9aaded00cfe0dab6853702bdff0c71495458de6c0eeef9bc')

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
  install -D -m 0755 {,$pkgdir/}usr/bin/containerd-shim-kata-v2
  install -D -m 0755 {,$pkgdir/}usr/bin/kata-runtime
  install -D -m 0755 {,$pkgdir/}usr/bin/kata-collect-data.sh
  install -D -m 0755 usr/libexec/kata-containers/kata-netmon $pkgdir/usr/lib/kata-containers/kata-netmon
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
