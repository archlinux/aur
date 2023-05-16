# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>
# Contributor: Martin Peres <martin.peres[at]free[dot]fr>
# Contributor: Timothée Ravier <tim[at]siosm[dot]fr>


pkgname=nouveau-fw
pkgver=340.108
pkgrel=1
pkgdesc="This package provides video & pgraph firmwares for all NVIDIA chipsets that need them"
url='http://nouveau.freedesktop.org/'
arch=('any')
license=('custom')
makedepends=(
  'python3'
  'git'
)
source=(
  #"http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}.run"
  "http://us.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run"
  "http://us.download.nvidia.com/XFree86/Linux-x86_64/325.15/NVIDIA-Linux-x86_64-325.15.run"

  "NVIDIA-Linux-x86_64-340.108.sha256"
  "NVIDIA-Linux-x86_64-325.15.sha256"

  "envytools-extractor"::"git+https://github.com/envytools/firmware/"
)

sha256sums=(
  'c671d4f1b7c09bc1af079b98b447adb06d704b04f802f7045a611fa50133b71b'
  '01446fbd94f6eb3b2e1b3d3f2b06970bf470c3ee2cb1838b3d0c2416e6c74500'

  '351ed2104129fa388230f1bf2255765dcbd0e2b5f9e950efeb541a98e149160b'
  'd773620e7108ee83e83206977d15622eb1216d6816da95cc5d630a0d960f3822'

  'SKIP'
)

build() {
  for _ver in 340.108 325.15 ; do
    (
      sh NVIDIA-Linux-x86_64-$_ver.run --extract-only
      python3 envytools-extractor/extract_firmware.py

      mkdir -p $_ver
      mv nv* vuc* $_ver/
      mv NVIDIA-Linux-x86_64-$_ver NVIDIA-Linux-x86_64-$_ver.done

      cd $_ver
      sha256sum -c ../NVIDIA-Linux-x86_64-$_ver.sha256
    )
  done
}

package() {
  mkdir -p "$pkgdir/usr/lib/firmware/nouveau/"

  for _ver in 340.108 325.15 ; do
    cp -n $_ver/* "$pkgdir/usr/lib/firmware/nouveau/" 2> /dev/null || true
  done
}

# vim:set ts=2 sw=2 et:
