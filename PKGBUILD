# Maintainer: dreieck
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
# Contributor: jaro3

_pkgname=wwwoffle
pkgname="${_pkgname}-svn"
# _pkgver=2.9j
epoch=1
pkgver=2.9j+svn2250
pkgrel=1
pkgdesc="Simple caching proxy server with special features (request, recursive fetch, subscription, modify HTML, ...) for use with dial-up internet links. Includes startup scripts for OpenRC, System V init, systemd."
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://www.gedanken.org.uk/software/wwwoffle/"
license=('GPL')
depends=('zlib' 'gnutls' 'libgcrypt')

provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-sysvinit=${pkgver}"
  "${_pkgname}-openrc=${pkgver}"
  "${_pkgname}-systemd=${pkgver}"
)
replaces=(
  "${_pkgname}<=${pkgver}"
  "${_pkgname}-sysvinit<=${pkgver}"
  "${_pkgname}-openrc<=${pkgver}"
  "${_pkgname}-systemd<=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-sysvinit"
  "${_pkgname}-openrc"
  "${_pkgname}-systemd"
)

backup=(
  'etc/conf.d/wwwoffle'
  'etc/wwwoffle/wwwoffle.conf'
  # 'etc/wwwoffle/wwwoffle.conf.template'
)

install="${_pkgname}.install"
options=('emptydirs')

_svnurl="http://gedanken.org.uk/svn/wwwoffle/trunk"

source=(
  # "http://www.gedanken.org.uk/software/wwwoffle/download/${_pkgname}-${_pkgver}.tgz"
  "${_pkgname}::svn+${_svnurl}"
  'conf_d_wwwoffle'
  'initscript_openrc'
  'initscript_systemd'
  'initscript_sysvinit'
  "${install}"
)

sha256sums=(
            # 'e6341a4ec2631dc22fd5209c7e5ffe628a5832ad191d444c56aebc3837eed2ae' # Main source, release
            'SKIP'                                                             # Main source, SVN
            '5491ffc23ae113db4b46167883594b5bcb6f1bbd0ce11432bc45047efbd635d2' # conf_d_wwwoffle
            'd9451db92f979a6573cecbab23c26b6ca8ea026ef61b22ec4b61c0c9051142e9' # initscript_openrc
            '03bebce87a0da1b383666ab7a95b9810e15f2a024c0954f09c959d342c5d9c87' # initscript_systemd
            '62139f2b77139cf9c1ce9761e27f6b427c12cadd7a3739f28d854b8328e7c511' # initscript_sysvinit
            '106f4ce3de6d6ea020e8dcd8a4fd4f78ed2ae855e8a953a8783134e4d2cfba12' # ${install}
)

_svnlog='svn.log'

_pgmver() {
  _unpackeddir="${srcdir}/${_pkgname}"

  # # Well, this _is_ useless use of cat, but to make it more clear to see in which order things are going on I do the cat first and then the grep.
  # _ver="$(cat "${_unpackeddir}/conf/wwwoffle.conf.template" | \
  #           grep -E '^#.*WWWOFFLE.*[Vv]ersion' | \
  #           head -n 1 | \
  #           sed 's|.* \([^ ]*\)$|\1|g' | \
  #           sed 's|\.$||g'
  #        )"

  # Well, this _is_ useless use of cat, but to make it more clear to see in which order things are going on I do the cat first and then the grep.
  _ver="$(cat "${_unpackeddir}/src/version.h" | \
            grep -E '^[[:space:]]*#define[[:space:]]+WWWOFFLE_VERSION' | \
            awk '{print $3}' | \
            tr -d \'\" | \
            awk -F+ '{print $1}'
        )"


  echo "${_ver}"

  if [ -z "${_ver}" ]; then
    return 1
  fi
}

_svnrelease() {
  _unpackeddir="${srcdir}/${_pkgname}"
  _rev="$(svn info "${_unpackeddir}" | grep '^Revision' | cut -d' ' -f2)"

  echo "${_rev}"

  if [ -z "${_rev}" ]; then
    return 1
  fi
}

pkgver() {
  _unpackeddir="${srcdir}/${_pkgname}"

  _ver="$(_pgmver)"
  _rev="$(_svnrelease)"

  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    echo "Aborting." > /dev/stderr
    false
    return 1
  fi

  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine SVN revision." > /dev/stderr
    echo "Aborting." > /dev/stderr
    false
    return 1
  fi

  echo "${_ver}+svn${_rev}"
}

prepare() {
  _unpackeddir="${srcdir}/${_pkgname}"

  cd "${_unpackeddir}"

  ### Update version.h to the actual version + SVNrevision
  _ver="$(_pgmver)"
  _rev="$(_svnrelease)"
  msg2 "Updating version in src/version.h to ${_ver}+svn${_rev} ..."
  sed -i 's|^\([[:space:]]*#define[[:space:]]*WWWOFFLE_VERSION[[:space:]]*\).*$|/*+ +*/\n/*+ The following line was automatically upgraded by the Arch Linux PKGBUILD (package build script) +*/\n/*+ in order to match the version as in conf/wwwoffle.conf.template and the SVN revision. +*/\n\1"'"${_ver}+svn${_rev}"'"|' \
   "${_unpackeddir}/src/version.h"

  msg2 "Generating svn commit messages file ..."
  svn log > "${_svnlog}"
}

build() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  ### Setting CFGLAGS.
  CFLAGS+=' -Wno-error=unused-result'
  export CFLAGS
  msg2 "Using the following CFLAGS: '${CFLAGS}'"

  ### Make the ./configure-script.
  # libtoolize --force
  # aclocal
  # autoheader
  msg2 "Running 'autoconf' to generate './configure' from 'configure.in' ..."
  autoconf -o configure -v configure.in

  ### Configure the Makefile.
  msg2 "Running './configure' (with options) ..."
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --exec-prefix=/usr \
    --with-zlib \
    --with-gnutls \
    --with-gcrypt \
    --with-ipv6 \
    --with-spooldir=/var/spool/wwwoffle \
    --with-confdir=/etc/wwwoffle \
    --with-default-language=en

  ### Build the software.
  msg2 "Running 'make' ..."
  make || return 1
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  ### Install the software.
  msg2 "Runnung 'make install' (with options) ..."
  make DESTDIR="${pkgdir}" install


  msg2 "Installing other files ..."

  ### Move documentation into the place we want it.
  mkdir -p "${pkgdir}/usr/share"
  mv -v "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"

  for _docfile in ChangeLog* "${_svnlog}"; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/wwwoffle/${_docfile}"
  done

  ### Symlink the HTML-Documentation under wwwoffle's spool directory to the documentation directory. Note: The html documentation needs to stay at wwwoffle's spool directory, since it serves it from there when it's webinterface is accessed.
  mkdir -p "${pkgdir}/usr/share/doc/wwwoffle/html"
  ln -sv "/var/spool/wwwoffle/html"/{de,en,es,fr,it,nl,pl,ru} "${pkgdir}/usr/share/doc/wwwoffle/html/"

  ### Install startup scripts for different init systems.
  install -D -m755 "${srcdir}/initscript_sysvinit" "${pkgdir}/etc/rc.d/wwwoffle"
  install -D -m755 "${srcdir}/initscript_openrc" "${pkgdir}/etc/init.d/wwwoffle"
  install -D -m644 "${srcdir}/initscript_systemd" "${pkgdir}/usr/lib/systemd/system/wwwoffle.service"

  ### Install a default initscript configuration file (for openrc and sysvinit only; for systemd user has to manually edit the systemd service file).
  install -D -m644 "${srcdir}/conf_d_wwwoffle" "${pkgdir}/etc/conf.d/wwwoffle"

  ### Change config such that wwwoffle runs as user wwwoffle and group wwwoffle. (Adding user and group is handled by the ${install}-script.)
  sed -i -e 's/^#run-uid.*/ run-uid           = wwwoffle/' "${pkgdir}/etc/wwwoffle/wwwoffle.conf"
  sed -i -e 's/^#run-gid.*/ run-gid           = wwwoffle/' "${pkgdir}/etc/wwwoffle/wwwoffle.conf"

  ### Move config into final place (such that it is not automatically used, but user actually has to do some manual work).
  mv "${pkgdir}/etc/wwwoffle/wwwoffle.conf" "${pkgdir}/etc/wwwoffle/wwwoffle.conf.template"

  ### Install contrib(uted) scripts and files for the user's disposal
  cp -av "${srcdir}/${_pkgname}"/{contrib,contrib-win32,doc/scripts} "${pkgdir}/usr/share/doc/wwwoffle/"

  ### Set permissions of spool directory.
  chmod -R ug=Xwr "${pkgdir}/var/spool/wwwoffle"
}
