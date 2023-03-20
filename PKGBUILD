# Maintainer: Nichlas Severinsen <ns@nsz.no>

_pkgname=dm-sflc
pkgname=$_pkgname-git-dkms
pkgver=v1.0.8.g4374989
pkgrel=1
pkgdesc="Linux kernel module for Shufflecake"
arch=("any")
url="https://shufflecake.net/"
license=("GPLv3")
depends=("dkms")
makedepends=("git" "linux-headers")
provides=("$_pkgname-dkms")
conflicts=("$_pkgname" "$_pkgname-dkms")
source=("$_pkgname::git+https://codeberg.org/shufflecake/dm-sflc.git#branch=dev_elia_refactor"
        "$_pkgname.conf")

sha256sums=("SKIP"
            "78633ce04767d596b4da903c18c2d7e8d46cc07cf4ac3bc8a228f1023870259e")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

package() {

  installDir="$pkgdir/usr/src/$_pkgname-dkms-${pkgver}"
  install -dm755 "$installDir"

  # Load dm-sflc-dkms automatically at boot
  install -dm755 "${pkgdir}/etc/modules-load.d" 
  install -m644 /dev/null "${pkgdir}/etc/modules-load.d/$_pkgname-dkms.conf"
  printf "$_pkgname-dkms\n" > "${pkgdir}/etc/modules-load.d/$_pkgname-dkms.conf"

  # Patch dkms file and rename it to the mandatory dkms.conf filename.
  install -m644 "${_pkgname}.conf" "${installDir}/dkms.conf"
  sed -e "s/@PKGVER@/${pkgver}/" \
      -i "${installDir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "$installDir/dkms.conf"

  # Copy sources (including Makefile)
  cp -r $srcdir/$_pkgname/* "$installDir"

  # Set build folder to root folder, as requested by DKMS
  echo "$installDir/src/Makefile"
  sed -e "s|/../bin|/../|" \
      -i "$installDir/src/Makefile"

}
