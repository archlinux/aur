# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Christian Hesse

_USE_CCACHE=false
if which ccache > /dev/null 2>&1; then
  _USE_CCACHE=true
fi
_WITH_NETWORKMANAGER=false
# _WITH_NETWORKMANAGER=true
_WITH_VALGRIND=false
# _WITH_VALGRIND=true
# _TOOLKIT='gtk2'
_TOOLKIT='gtk3'
# _PROTECTEDHEADERSPATCHVARIANT=nopicturesplease # Use the patch from https://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=4426#c39.
_PROTECTEDHEADERSPATCHVARIANT=filippo          # Use the patch from https://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=4007#c4.

_pkgname='claws-mail'
case "${_TOOLKIT}" in
  'gtk2')
    _pkgvariant="${_TOOLKIT}"
    _gitbranch="${_TOOLKIT}"
  ;;
  'gtk3')
    _pkgvariant="protectedheaders"
    _gitbranch='master'
  ;;
  *)
    _pkgvariant="${_TOOLKIT}-protectedheaders"
    _gitbranch="${_TOOLKIT}"
  ;;
esac

pkgname="${_pkgname}-${_pkgvariant}-git"
epoch=0
pkgver=4.3.1+194.r13679.20251211.3a3d3a020
pkgrel=1
pkgdesc="A GTK based e-mail client. Latest git checkout, built against '${_TOOLKIT}'. Patched to use charset supersets to decode titles and to display protected headers."
arch=(
  'i686'
  'x86_64'
)
license=('GPL-3.0-or-later')
url='https://www.claws-mail.org/'
depends=(
  'cairo'
  'compface'
  'dbus-glib'
  'enchant'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gnutls'
  'gpgme'
  "${_TOOLKIT}"
  'hicolor-icon-theme'
  'libice'
  'libetpan'
  'libsm'
  'libldap'
  'librsvg'
  'nettle'
  'pango'
  'startup-notification'
)
makedepends=(
  'ayatana-ido'
  'git'
  'glib2-devel'
  'python>=3'
  'spamassassin'
  # dependencies for plugins:
  'bogofilter'
  'dillo'
  'gumbo-parser>=0.12'
  'libayatana-appindicator'
  'libcanberra'
  'libdbusmenu-glib'
  'libgdata'
  'libgoa'
  'libical'
  'libnotify'
  'libxml2'
  'libytnef'
  'poppler-glib'
  # 'pygtk' # This requires python2 stuff to build. Most probably obsolete as (make) dependency.
  # dependencies to build the docs:
  'docbook-utils'
  'lynx'
  'texlive-core'
  'texlive-formatsextra'
)
optdepends=(
  'claws-mail-theme-basicsvg: BasicSVG icon theme for Claws Mail.'
  'claws-mail-tango-theme: Tango icon theme for Claws Mail.'
  'papirus-claws-mail-theme: Papirus icon theme for Claws Mail.'
  "claws-mail-plugin-reloader: Reload plugins from the 'tools' menu (for development)."
  'bash:              for some extra tools.'
  'at-spi2-core:      for many plugins.'
  'bogofilter:        for bogofilter plugin.'
  'curl:              for vcalendar, rssyl and spamreport plugins.'
  'dbus:              for notification plugin.'
  'libx11:            for notification plugin.'
  'dillo:             for dillo html viewer plugin.'
  'expat:             for rssyl plugin.'
  'fontconfig:        for litehtml_viewer plugin.'
  'freetype2:         for litehtml_viewer plugin.'
  'gcc-libs:          for litehtml_viewer plugin.'
  'gumbo-parser>=0.12: for litehtml_viewer plugin.'
  'ghostscript:       for pdf viewer plugin.'
  'harfbuzz:          for many plugins'
  'jpilot:            for jpilot (palm pilot connection) plugin.'
  'libarchive:        for archive plugin and various other plugins.'
  'ayatana-ido:       for notification plugin.'
  'libcanberra:       for notification plugin.'
  'libdbusmenu-glib:  for notification plugin.'
  'libayatana-appindicator: for notification plugon.'
  'libgpg-error:      for GPG and S-MIME plugins.'
  'libical:           for vcalendar plugin.'
  'libnotify:         for notification plugin.'
  'libytnef:          for tnef_parse plugin.'
  'libxcrypt:         for perl plugin.'
  'perl:              needed for some tools and perl plugin.'
  'poppler-glib:      for pdf viewer plugin.'
  'python2:           needed for some tools and python plugin.'
  'python>=3:         for some tools/ plugins.'
  'spamassassin:      for spamassassin plugin.'
  'zlib:              for many plugins.'
  'json-glib:         for gdata plugin.'
  'libgdata:          for gdata plugin.'
  'libgoa:            for gdata plugin.'
  'libxml2:           for gdata plugin.'
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
  "${_pkgname}-${_TOOLKIT}=${pkgver}"
  "${_pkgname}-title-superset=${pkgver}"
  "${_pkgname}-protectedheaders=${pkgver}"
  "${_pkgname}-bash-completion"
  "claws-mail-extra-plugins=${pkgver}"
)
source=(
  "${_pkgname}::git://git.claws-mail.org/claws.git#branch=${_gitbranch}"
  "0000_encoding.diff::https://aur.archlinux.org/cgit/aur.git/plain/0001_encoding.diff?h=claws-mail-title-superset" ## NOTE!, if this gets removed, adapt the `provides` array and the `$pkgdesc`!
)
sha256sums=(
  'SKIP'                                                              # Main upstream git source
  '79e2b664d039f5cc0cf642359923e3d100ffc4ab070fc54c02d5792b624e26f6'  # '0000_encoding.diff'
)
case "${_PROTECTEDHEADERSPATCHVARIANT}" in
  'nopicturesplease')
    source+=("0002_protectedheaders.patch::http://web.archive.org/web/20240721164745/https://www.thewildbeast.co.uk/claws-mail/bugzilla/attachment.cgi?id=2331")
    sha256sums+=('383f4ea03102ed2c8f19365b9bf2b757969d1617fcfd0a8375126f388cc60301')
    if [ "${_TOOLKIT}" == "gtk2" ]; then
      source+=("protectedheaders.patch.for-gtk2.patch")
      sha256sums+=('3b1e568398950eb93d879353cfd6d49d81f7e1790c24972f36846f22ef4106cb')
    fi
  ;;
  'filippo')
    source+=("read_enc_subject.tar.gz::http://web.archive.org/web/20240721164805/https://www.thewildbeast.co.uk/claws-mail/bugzilla/attachment.cgi?id=2350")
    sha256sums+=('70b2595830dce73d85600190258389216b4aa613f88ebbedc6088a806c7b01f1')
  ;;
  *)
    error "Please edit the 'PKGBUILD' to specify a valid provider of the protected headers patch (variable '_PROTECTEDHEADERSPATCHVARIANT' at the beginning of the 'PKGBUILD')."
    exit 1
  ;;
esac


if "${_USE_CCACHE}"; then
  makedepends+=('ccache')
  options+=('ccache')
fi
if [ "${_TOOLKIT}" == "gtk2" ]; then
  _fancy_config_opts=('--disable-fancy-plugin')
else
  makedepends+=(
    'libsoup3'
    'webkit2gtk-4.1'
  )
  optdepends+=(
    'libjavascriptcoregtk-4.1.so: for fancy webkit html viewer plugin.'
    'libwebkit2gtk-4.1.so:        for fancy webkit html viewer plugin.'
    'libsoup3:                    for fancy webkit html viewer plugin.'
  )
  _fancy_config_opts=('--enable-fancy-plugin')
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

  #for _patch in "${srcdir}/....patch"; do
  #  printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
  #  patch -Np1 --follow-symlinks -i "${_patch}"
  #done
  rm -fv po/Makefile.in.in

  for _patch in "${srcdir}/0000_encoding.diff"; do
   printf '%s\n' "   > Applying patch '${_patch}' ..."
   patch -N -p1 --follow-symlinks -i "${_patch}"
  done

  case "${_PROTECTEDHEADERSPATCHVARIANT}" in
   'nopicturesplease')
     if [ "${_TOOLKIT}" == "gtk2" ]; then
       printf '%s\n' "   > Patching '0002_protectedheaders.patch' for GTK2 ..."
       patch -N --follow-symlinks -i "${srcdir}/protectedheaders.patch.for-gtk2.patch" -o "${srcdir}/0002_protectedheaders-${_TOOLKIT}.patch" "${srcdir}/0002_protectedheaders.patch"
     else
       cp "${srcdir}/0002_protectedheaders.patch" "${srcdir}/0002_protectedheaders-${_TOOLKIT}.patch"
     fi
     for _patch in "${srcdir}/0002_protectedheaders-${_TOOLKIT}.patch"; do
       printf '%s\n' "   > Applying patch '${_patch}' ..."
       patch -N -p1 --follow-symlinks -i "${_patch}"
     done
   ;;
   'filippo')
     for _patch in "${srcdir}"/{0001-PGP-MIME-fix-leak-of-MimeInfo-if-parsing-fails,0002-Substitute-Subject-header-when-decrypting,0003-TextView-move-header-extraction-to-textview_process_,0004-PGPMime-return-full-decrypted-message-instead-of-fir}.patch; do
       printf '%s\n' "   > Applying patch '${_patch}' ..."
       patch -N -p1 --follow-symlinks -i "${_patch}"
     done
   ;;
   *)
     error "Please edit the 'PKGBUILD' to specify a valid provider of the protected headers patch (variable '_PROTECTEDHEADERSPATCHVARIANT' at the beginning of the 'PKGBUILD')."
     return 1
   ;;
  esac

  printf '%s\n' "   > Generating git log ..."
  git log > "${srcdir}/git.log"

  # Generate ./configure
  # if [ ! -e configure ]; then
  printf '%s\n' "   > Generating './configure' ..."
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
    "${_fancy_config_opts[@]}"
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

  printf '%s\n' "   > Running './configure <options>' ..."
  ./configure "${_configure_opts[@]}"
  printf '%s\n' "   > Running 'make' ..."
  make

  # build extra tools
  pushd tools 2>/dev/null
  printf '%s\n' "   > Running 'make' in './tools/' ..."
  make
  popd 2>/dev/null
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' "   > Runnung 'make install' ..."
  make DESTDIR="${pkgdir}" install

  # install extra tools
  printf '%s\n' "   > Installing extra tools ..."
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
  printf '%s\n' "   > Installing extra documentation and license ..."
  for _docfile in ABOUT-NLS AUTHORS ChangeLog* INSTALL NEWS README RELEASE_NOTES version; do
      install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  ln -svr "${pkgdir}/usr/lib/${_pkgname}/tools/README" "${pkgdir}/usr/share/doc/${_pkgname}/README-tools"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
  install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install bash completion
  printf '%s\n' "   > Installing bash completion ..."
  install -D -v -m644 "tools/bash_completion/claws-mail" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
