# Maintainer: dreieck
# Contributor: Christian Hesse

_USE_CCACHE=false
# _USE_CCACHE=true
_WITH_NETWORKMANAGER=false
# _WITH_NETWORKMANAGER=true
_WITH_VALGRIND=false
# _WITH_VALGRIND=true
_TOOLKIT='gtk2'
# _TOOLKIT='gtk3'

_pkgname='claws-mail'
_pkgvariant="${_TOOLKIT}"
_gitbranch="${_TOOLKIT}"
pkgname="${_pkgname}-${_pkgvariant}-git"
epoch=0
pkgver=3.19.1+53.r11660.20230624.4e413c136
pkgrel=1
pkgdesc='A GTK based e-mail client. Latest git checkout of GTK2 branch. Patched to use charset supersets to decode titles'
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
  "${_pkgname}-title-superset=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
  "${_pkgname}-title-superset-${_pkgvariant}=${pkgver}"
  "${_pkgname}-bash-completion"
  "claws-mail-extra-plugins=${pkgver}"
)
source=(
  "${_pkgname}::git://git.claws-mail.org/claws.git#branch=${_gitbranch}"
  "0001_encoding.diff::https://aur.archlinux.org/cgit/aur.git/plain/0001_encoding.diff?h=claws-mail-title-superset" ## NOTE!, if this gets removed, adapt the `provides` array and the `$pkgdesc`!
)
sha256sums=(
  'SKIP'
  '79e2b664d039f5cc0cf642359923e3d100ffc4ab070fc54c02d5792b624e26f6'
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
if "${_WITH_VALGRIND}"; then
  makedepends+=('valgrind')
  _valgrind_config_opts=('--enable-valgrind')
else
  _valgrind_config_opts=('--disable-valgrind')
fi



prepare() {
  cd "${srcdir}/${_pkgname}"

  ls -1 "${srcdir}"/*.diff "${srcdir}"/*.patch 2>/dev/null | sort -V | while read _patch; do
    msg2 "Applying patch '${_patch}' ..."
    patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  msg2 "Generating git log ..."
  git log > "${srcdir}/git.log"

  # Generate ./configure
  # if [ ! -e configure ]; then
  msg2 "Generating './configure' ..."
  NOCONFIGURE=1 ./autogen.sh
  # fi
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
    "${_valgrind_config_opts[@]}"
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

  msg2 "Running './configure <options>' ..."
  ./configure "${_configure_opts[@]}"
  msg2 "Running 'make' ..."
  make

  # build extra tools
  pushd tools 2>/dev/null
  msg2 "Running 'make' in './tools/' ..."
  make
  popd 2>/dev/null
}

package() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Runnung 'make install' ..."
  make DESTDIR="${pkgdir}" install

  # install extra tools
  msg2 "Installing extra tools ..."
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

  # Install more information
  msg2 "Installing extra documentation and license ..."
  for _docfile in ABOUT-NLS AUTHORS ChangeLog* INSTALL NEWS README RELEASE_NOTES TODO version; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svr "${pkgdir}/usr/lib/${_pkgname}/tools/README" "${pkgdir}/usr/share/doc/${_pkgname}/README-tools"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
  install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install bash completion
  msg2 "Installing bash completion ..."
  install -D -v -m644 "tools/bash_completion/claws-mail" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
