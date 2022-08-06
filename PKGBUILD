# Maintainer: dreieck
# Contributor: Christian Hesse

_USE_CCACHE=false
# _USE_CCACHE=true
_WITH_NETWORKMANAGER=false
# _WITH_NETWORKMANAGER=true
_TOOLKIT='gtk2'
# _TOOLKIT='gtk3'

_pkgname='claws-mail'
_pkgvariant="${_TOOLKIT}"
_gitbranch="${_TOOLKIT}"
pkgname="${_pkgname}-${_pkgvariant}-git"
epoch=0
pkgver=3.19.0+61.r11578.20220802.c51af48dd
pkgrel=1
pkgdesc='A GTK based e-mail client. Latest git checkout of GTK2 branch.'
arch=(
  'i686'
  'x86_64'
)
license=('GPL3')
url='https://www.claws-mail.org/'
depends=(
  'compface'
  'dbus-glib'
  'desktop-file-utils'
  'enchant'
  'gnutls'
  'gpgme'
  "${_TOOLKIT}"
  'hicolor-icon-theme'
  'libetpan'
  'libsm'
  'startup-notification'
)
makedepends=(
  'git'
  'python'
  'spamassassin'
  'valgrind'
  # dependencies for plugins:
  'bogofilter'
  'dillo'
  'gumbo-parser'
  'libcanberra'
  'libgdata'
  'libical'
  'libnotify'
  'libytnef'
  'poppler-glib'
  'pygtk'
  # dependencies to build the docs:
  'docbook-utils'
  'texlive-core'
  'texlive-formatsextra'
)
optdepends=(
  'bogofilter:        adds support for spamfiltering.'
  'curl:              for vcalendar, rssyl and spamreport plugins.'
  'dbus:              for notification plugin.'
  'dillo:             for dillo html viewer plugin.'
  'ghostscript:       for pdf viewer plugin.'
  'gumbo-parser:      for litehtml_viewer plugin.'
  'jpilot:            for jpilot (palm pilot connection) plugin.'
  'libarchive:        for archive plugin and various other plugins.'
  'libcanberra:       for notification plugin.'
  'libgdata:          for gdata plugin.'
  'libical:           for vcalendar plugin.'
  'libnotify:         for notification plugin.'
  'libxml2:           for rssyl plugins.'
  'libytnef:          for tnef_parse plugin.'
  'perl:              needed for some tools and perl plugin.'
  'poppler-glib:      for pdf viewer plugin.'
  'python2:           needed for some tools and python plugin.'
  'python:            for some tools/ plugins.'
  'spamassassin:      adds support for spamfiltering.'
)
replaces=(
  'claws-mail-extra-plugins'
  'sylpheed-claws'
)
conflicts=(
  'claws'
  "${_pkgname}"
  "${_pkgname}-${_pkgvariant}"
  "${_pkgname}-bash-completion"
  'claws-mail-extra-plugins'
  'sylpheed-claws'
)
provides=(
  "claws=${pkgver}"
  "${_pkgname}=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
  "${_pkgname}-bash-completion"
  "claws-mail-extra-plugins=${pkgver}"
)
source=(
  "${_pkgname}::git://git.claws-mail.org/claws.git#branch=${_gitbranch}"
)
sha256sums=(
  'SKIP'
)


if "${_USE_CCACHE}"; then
  options+=('ccache')
fi
if "${_WITH_NETWORKMANAGER}"; then
  makedepends+=('networkmanager')
  optdepends+=('networkmanager:    for NetworkManager network connection query.')
  _networkmanager_config_opts=('--enable-networkmanager')
else
  _networkmanager_config_opts=('--disable-networkmanager')
fi


prepare() {
  cd "${srcdir}/${_pkgname}"

  # Generate ./configure
  if [ ! -e configure ]; then
    NOCONFIGURE=1 ./autogen.sh
  fi
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  _configure_opts=(
    --prefix=/usr
    --disable-static
    --enable-shared
    --enable-nls
    --enable-manual
    --enable-libsm
    --enable-ipv6
    --enable-gnutls
    --enable-enchant
    --enable-crash-dialog
    --disable-generic-umpc
    --enable-compface
    --enable-pthread
    --enable-startup-notification
    --enable-dbus
    --enable-ldap
    --enable-jpilot
    "${_networkmanager_config_opts[@]}"
    --enable-libetpan
    --disable-valgrind
    --disable-alternate-addressbook # add --enable-alternate-addressbook to the options to use the new/alternate address book (which could break things!). Do not forget to add claws-contacts to the dependencies then
    --enable-svg
    --enable-deprecated
    --enable-acpi_notifier-plugin
    --enable-address_keeper-plugin
    --enable-archive-plugin
    --enable-att_remover-plugin
    --enable-attachwarner-plugin
    --enable-bogofilter-plugin
    --enable-bsfilter-plugin
    --enable-clamd-plugin
    --enable-dillo-plugin
    --disable-fancy-plugin
    --enable-fetchinfo-plugin
    --enable-gdata-plugin
    --enable-libravatar-plugin
    --enable-litehtml_viewer-plugin
    --enable-mailmbox-plugin
    --enable-managesieve-plugin
    --enable-newmail-plugin
    --enable-notification-plugin
    --enable-pdf_viewer-plugin
    --enable-perl-plugin
    --enable-python-plugin
    --enable-pgpcore-plugin
    --enable-pgpmime-plugin
    --enable-pgpinline-plugin
    --enable-rssyl-plugin
    --enable-smime-plugin
    --enable-spamassassin-plugin
    --enable-spam_report-plugin
    --enable-tnef_parse-plugin
    --enable-vcalendar-plugin
    --enable-demo-plugin
  )

#   unset MAKEFLAGS
#   unset CFLAGS
#   unset CXXFLAGS
#   unset LDFLAGS

  ./configure "${_configure_opts[@]}"
  make

  # build extra tools
  pushd tools 2>/dev/null
  make
  popd 2>/dev/null
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  # install extra tools
  # all executables and .conf files; only top directory
  pushd tools 2>/dev/null
  for _file in *.pl *.sh *.py tb2claws-mail update-po uudec uuooffice; do
    install -D -v -m755 "${_file}" "${pkgdir}/usr/lib/${_pkgname}/tools/${_file}"
  done
  for _file in *.txt *.conf README; do
    install -D -v -m644 "${_file}" "${pkgdir}/usr/lib/${_pkgname}/tools/${_file}"
  done
  for _dir in kdeservicemenu; do
    cp -arv "${_file}" "${pkgdir}/usr/lib/${_pkgname}"/tools/
  done
  popd 2>/dev/null

  # Install more information files.
  for _docfile in ABOUT-NLS AUTHORS ChangeLog* INSTALL NEWS README RELEASE_NOTES TODO version; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svr "${pkgdir}/usr/lib/${_pkgname}/tools/README" "${pkgdir}/usr/share/doc/${_pkgname}/README-tools"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
  install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install bash completion
  install -D -v -m644 "tools/bash_completion/claws-mail" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
