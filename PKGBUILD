# Maintainer: dreieck
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
# Contributor: jaro3

_pkgname=wwwoffle
pkgname="${_pkgname}-svn"
# _pkgver=2.9i
epoch=1
pkgver=2.9j+svn2226
pkgrel=1
pkgdesc="Simple caching proxy server with special features (request, recursive fetch, abonnement, modify HTML, ...) for use with dial-up internet links. Includes startup scripts for OpenRC, System V init, systemd."
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
  'etc/wwwoffle/wwwoffle.conf'
  'etc/wwwoffle/wwwoffle.conf.template'
)

install="${_pkgname}.install"

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
  # 'e6341a4ec2631dc22fd5209c7e5ffe628a5832ad191d444c56aebc3837eed2ae'
  'SKIP'
  'cd05738f73b109dd074f6dd919300eeae55c2aa812a15e0ae61b32622423c867'
  '0d5bfcd1e348f6bdad042f780b2ea8a235314d5750a66ae008a0ea391bc5cc11'
  '04fd88f2a100e3ff9a96da6a70e58457252722cbf6350ffdbf08f17e62b64869'
  '47f3df8ed05888452c00f8246f97456a4c55499b67e59c40da272b0e7fb1f2df'
  '1b5ac98fff7a5c7b32439410cffdbdd8224c19fe8ca02db948d1a4430de793fd'
)

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
  find "${srcdir}"/*.patch -xtype f 2>/dev/null | while read _patch; do
    msg "Applying patch '${_patch}' ..."
    patch -p1 < "${_patch}" || exit "$?"
  done
  
  ### Update version.h to the actual version.
  _ver="$(_pgmver)"
  _rev="$(_svnrelease)"
  msg "Updating version in src/version.h to ${_ver}+svn${_rev}..."
  sed -i 's|^\([[:space:]]*#define[[:space:]]*WWWOFFLE_VERSION[[:space:]]*\).*$|/*+ +*/\n/*+ The following line was automatically upgraded by the Arch Linux PKGBUILD (package build script) +*/\n/*+ in order to match the version as in conf/wwwoffle.conf.template and the SVN revision. +*/\n\1"'"${_ver}+svn${_rev}"'"|' \
    "${_unpackeddir}/src/version.h"
}

build() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  ### Make the ./configure-script.
  # libtoolize --force
  # aclocal
  # autoheader
  autoconf -o configure -v configure.in
  
  ### Configure the Makefile.
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --exec-prefix=/usr \
    --with-zlib=/usr/include \
    --with-gnutls=/usr/include/gnutls \
    --with-gcrypt=/usr/include \
    --with-ipv6 \
    --with-spooldir=/var/spool/wwwoffle \
    --with-confdir=/etc/wwwoffle \
    --with-default-language=en
  
  ### Build the software.
  make || return 1
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  ### Install the software.
  make DESTDIR="${pkgdir}" install

  ### Move documentation into the place we want it.
  mkdir -p "${pkgdir}/usr/share"
  mv -v "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"

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
}
