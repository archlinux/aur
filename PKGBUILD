# Maintainer: Boris Momcilovic <boris.momcilovic@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: Mark Blakeney at bullet-systems dot net

pkgname=python-pssh
pkgver=2.3.1
pkgrel=10
pkgdesc="Parallel versions of the openssh tools ssh, scp, rsync, nuke, slurp"
arch=('any')
url="http://code.google.com/p/parallel-ssh/"
license=('BSD')
depends=('openssh' 'python')
makedepends=('patch')
changelog=$pkgname.changelog
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/parallel-ssh/pssh-$pkgver.tar.gz
        Imports-are-absolute-by-default-in-Python3.patch
        pssh-typeerror-str-does-not-support-the-buffer-interface.patch
        pssh-valueerror-the-fd-4-must-be-in-non-blocking-mode.patch
        pssh-read-stdin-as-bytes-in-Python-3.patch
	Relative-paths-should-be-allowed.patch)
sha256sums=('539f8d8363b722712310f3296f189d1ae8c690898eca93627fc89a9cb311f6b4'
            '12257c60e7db3d152f0b3307d0cd0263a95bddfc856aa570908a0491a1a03c56'
            '6b4574810b09f4ca855b81a036643aa27613ea69e1cd92755b9b9f155985d332'
            '40b01fd5c2aa59542a5d1bf65a41b861733f71305a9799c1d1ca6661f228a891'
            '47c1af738d4ba252e9f35c5633da91bae2a2919a7b6b2bf425ee1f090d61c7fe'
            '3ba2ec624ac2aa3dbd832311ade97b65ab389b4b4aa55a4b672447809c7b463a')

prepare() {
  cd "${srcdir}"/pssh-$pkgver

# fix FS#28626 (merged upstream)
  patch -Np1 -i ../Imports-are-absolute-by-default-in-Python3.patch
# fix FS#41255
  patch -Np0 -i ../pssh-typeerror-str-does-not-support-the-buffer-interface.patch
# fix FS#46571
  patch -Np0 -i ../pssh-valueerror-the-fd-4-must-be-in-non-blocking-mode.patch
# fix FS#5153
  patch -Np1 -i ../pssh-read-stdin-as-bytes-in-Python-3.patch
# fix to allow relative paths
  patch -Np1 -i ../Relative-paths-should-be-allowed.patch
}

package() {
  cd "${srcdir}"/pssh-$pkgver

  python setup.py install --root "${pkgdir}"

# fix manpages
  install -d "${pkgdir}"/usr/share
  mv "${pkgdir}"/usr/man "${pkgdir}"/usr/share

# fix putty pscp file conflict
  mv "${pkgdir}"/usr/bin/pscp "${pkgdir}"/usr/bin/psshscp
  mv "${pkgdir}"/usr/share/man/man1/pscp.1 "${pkgdir}"/usr/share/man/man1/psshscp.1

# license
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
