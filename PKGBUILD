# Maintainer: fft

pkgname=p4-fusion-git
pkgver=v1.13.r20.gb36b8b6
pkgrel=1
pkgdesc='Perforce to Git conversion tool'
arch=('x86_64')
url='https://github.com/salesforce/p4-fusion'
depends=('libgit2' 'openssl')
makedepends=('git')
license=('BSD-3-Clause')
conflicts=(p4-fusion) # for the future, if anybody else will package it.
provides=(p4-fusion)
source=(
  "${pkgname}::git+https://github.com/salesforce/p4-fusion.git"
  "https://filehost.perforce.com/perforce/r25.1/bin.linux26x86_64/p4api-glibc2.12-openssl3.tgz"
   # seems https://www.perforce.com/downloads/perforce/r25.1/bin.linux26x86_64/p4api-glibc2.12-openssl3.tgz
   # can download archive with old version of p4pai, while cdist2 instead of filehost is also allowed
  'p1.patch::https://github.com/fftmp-forked/p4-fusion/commit/2e51b94c0baf55ef6b5bbe42cc13c39d61573dff.patch'
  'p2.patch::https://github.com/fftmp-forked/p4-fusion/commit/4b0d8bb01afeafd06ee412fabc2f753107b8837a.patch'
  'p3.patch::https://github.com/fftmp-forked/p4-fusion/commit/c95d73496b14c6d9938f3a80473f096942e757ed.patch'
  'p4.patch::https://github.com/fftmp-forked/p4-fusion/commit/75fd3580202373de9645819a2d0460ab2a4625c6.patch'
)

b2sums=(
  'SKIP'
  '90b3ff1e516cf610b1a51d8b31c91bec9a8b41206a4fac3bc32f4fe5dd9c360ab5638645ad5ef2d258c9edee0021035017ef192d9fe0064b676272f4f6d410a6'
  '46f04fd4ca25b16ec5b52392ffcfb7b41f97fa7f198fce001f708e6ea6c487ef8796b692050d95d8eb13fb5f03ba03fdd67574a5924d1916f5f4a98e10528338'
  '59a77eca60cf2293cb728fa777d9d993672c37d0950f64b0d0d7b421aec9f53db47d1a04b9b70226c78b7fc3d63375692bb518d36a050e5847cdbb9cba2a686e'
  'e5ba4e3a7367e2c7235161c838719e1022e4b2d44562f88a1432c2f6a3a4f31032cfdb60af3f5af4e1c53601832eb88d7dc2f369462ce6c6c7f807c798d01f3a'
  'a891cdad19aa528e8db583f68eb39679959c1af9725357de386a3145a6f1b8849595e4536b75e20f4d9b989c3765f9da7781fed89edd27be95cc7d814c9b443d'
)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git clean -fxd
  git apply "${srcdir}/p1.patch"
  git apply "${srcdir}/p2.patch"
  git apply "${srcdir}/p3.patch"
  git apply "${srcdir}/p4.patch"
  mkdir -p 'vendor/helix-core-api/linux/'
  cp -r '../p4api-2025.1.2761706/include/' '../p4api-2025.1.2761706/lib/' './vendor/helix-core-api/linux/'
}

build() {
  cd "${pkgname}"
  cmake ./
  cmake --build ./
}

package() {
  cd "${pkgname}"
  install -Dm755 'p4-fusion/p4-fusion' "${pkgdir}/usr/bin/p4-fusion"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
