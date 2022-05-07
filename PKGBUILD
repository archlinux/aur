_pkgname=screen
pkgname=${_pkgname}-nosuid-bin-not-git
pkgver=4.9.0+rel1
pkgrel=1
pkgdesc='Screen, repacked without suid'
url='https://www.gnu.org/software/screen/'
arch=('x86_64')
license=('GPL')
depends=('ncurses' 'pam')
provides=("$_pkgname")
conflicts=("$_pkgname")

backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!strip')

pkgver() {
  _srcname=$(curl -Lsf "https://www.archlinux.org/packages/community/${CARCH}/${_pkgname}/json" |sed 's/^.*"filename" *: *"\([^,]*\)".*$/\1/')
  [ -n "$_srcname" ]
  IFS='-' read -ra ver <<< "$_srcname"
  echo "$_srcname" > srcname
  echo "${ver[1]#*:}+rel${ver[2]}" # remove epoch, add pkgrel
}

build() {
  _srcname=$(cat srcname)
  cd ..
  curl -fLR {-o,-z}"$_srcname" "https://mirror.pkgbuild.com/community/os/${CARCH}/$_srcname"
}

package() {
  _srcname=$(cat srcname)
  bsdtar -C "${pkgdir}" --no-same-owner -xf ../"$_srcname"
  rm "${pkgdir}"/{.BUILDINFO,.MTREE,.PKGINFO}
  chmod 0755 "${pkgdir}"/usr/bin/screen-*
  echo 'd /run/screens 0777 root root -' > "${pkgdir}/usr/lib/tmpfiles.d/screen.conf"
}
