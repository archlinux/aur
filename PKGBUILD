# Maintainer: Brent Saner <bts (at) phreewifi (dot) org>
# Special thanks to ejabberd-mod_admin_extra-svn maintainer
# Damian Nowak <damian.nowak@pacmanvps.com> and contributor
# Thomas Mudrunka <harvie@@email..cz> for giving me a model
# to base this on.

pkgname=ejabberd-mod_all-git
pkgver=r84.a1eb77b
pkgrel=1
pkgdesc="A package for ALL ejabberd modules"
arch=('any')
url="https://www.ejabberd.im/ejabberd-contrib"
license=('GPL')
depends=('ejabberd')
makedepends=('erlang-nox' 'git')
conflicts=('ejabberd-mod_admin_extra-svn' 'ejabberd-mod_archive' 'ejabberd-mod_muc_admin')
source=('git+git://github.com/processone/ejabberd-contrib.git')
md5sums=('SKIP')

# and to save some typing, because I am lazy.
_swname="ejabberd-contrib"

## HAH. autoincrement.
pkgver() {
  cd "${_swname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_swname}
  ROOTDIR=$(pwd)

  mkdir ${ROOTDIR}/docs
  
  for module in $(ls -1d mod_*);
  do
    cd ${module}

    # We should probably grab the READMEs.
    for README in $(ls -1 README*);
    do
      cp "${README}" "${ROOTDIR}/docs/${module}.${README}"
    done

    # Hey, thanks, ProcessOne!
    ./build.sh


    cd ${ROOTDIR}
  done

  # These are provided as part of the vanilla package, apparently.
  for EXISTING in ejabberd_c2s ejabberd_sup iconv mod_irc mod_muc_room mod_register_web;
  do
    find ./ -type f -iname "${EXISTING}.beam" -delete
  done

  install -d -m 0755 "${pkgdir}"/usr/lib/ejabberd/ebin
  install -d -m 0755 "${pkgdir}"/usr/share/doc/ejabberd-mod_all
  install -d -m 0755 "${pkgdir}"/usr/share/ejabberd/data

  find ./mod_*/ebin/ -type f -iname "*.beam" -exec cp '{}' "${pkgdir}"/usr/lib/ejabberd/ebin/. \;
  cp -r ${ROOTDIR}/docs/* ${pkgdir}/usr/share/doc/ejabberd-mod_all/.
  cp -a ${ROOTDIR}/mod_webpresence/data ${pkgdir}/usr/share/ejabberd/

  cd ${srcdir}
  rm -rf ${_swname}
}
