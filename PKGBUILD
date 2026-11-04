# Maintainer: executter <executter at hotmail dot com>

pkgname=openrsat
pkgver=0.4.519
pkgrel=1
pkgdesc='Open source RSAT alternative to manage Active Directory and Samba AD (Qt6)'
arch=('x86_64')
url='https://github.com/tranquilit/OpenRSAT'
# Free Pascal links every unit statically: the binary contains OpenRSAT,
# its submodules, the FPC RTL/FCL and the LCL, plus the mORMot2 static
# objects. Inventory taken from the linker map (-Xm) of this build.
# LicenseRef-FPC-modified-LGPL is the LGPL with the FPC static linking
# exception (SPDX: Independent-modules-exception, which the licenses
# package does not list yet, hence the custom route).
license=(
  # OpenRSAT (README: "GNU General Public License v3.0", no "or later")
  'GPL-3.0-only'
  # mORMot2, pltis_djoin (the LGPL option carries the FPC exception)
  'MPL-1.1 OR GPL-2.0-or-later OR LicenseRef-FPC-modified-LGPL'
  # pltis_virtualtrees
  'MPL-1.1 OR LGPL-2.1-or-later'
  # pltis_uicomponents (repository ships the GPL-2.0 text, no version notice)
  'GPL-2.0-only'
  # pltis_utils: the linked units (tisinifiles, tisstrings) come from the JCL
  'MPL-1.1'
  # metadarkstyle
  'LGPL-2.1-or-later'
  # FPC RTL/FCL (COPYING.FPC) and LCL (COPYING.modifiedLGPL)
  'LicenseRef-FPC-modified-LGPL'
  # libdeflate (mORMot2 static archive)
  'MIT'
  # Intel SSE4 SHA-256/512 and CRC32C code (mORMot2)
  'BSD-3-Clause'
  # paszlib (FCL), Wolfgang Ehrhardt's AES/SHA-3 code (mORMot2)
  'Zlib'
  # pasjpeg (FCL)
  'IJG'
)
depends=(
  'glibc'
  'hicolor-icon-theme'
  'krb5'  # dlopen'd: Kerberos (GSSAPI) authentication
  'libx11'
  'openssl'  # dlopen'd: LDAPS / TLS
  'qt6pas'
  'zlib'
)
makedepends=(
  'fpc'
  'fpc-src'
  'git'
  'lazarus'
)
# The upstream build mode disables debug information and strips (-Xs).
# FPC 3.2.2 cannot produce PIE executables.
options=('!debug')
# mORMot2 needs prebuilt static objects matching its sources. This
# release asset is byte-identical to the archive listed in
# static/dev.sha256 at the mORMot2 commit pinned by OpenRSAT v0.4.519.
_mormot_static=2.4-stable
# Upstream signs its commits with X.509 (gpgsm), which makepkg cannot
# verify: the checksum below pins the content of the tag instead.
source=(
  "git+https://github.com/tranquilit/OpenRSAT.git#tag=v$pkgver"
  'git+https://github.com/synopse/mORMot2.git'
  'git+https://github.com/zamtmn/metadarkstyle.git'
  'git+https://github.com/tranquilit/pltis_djoin.git'
  'git+https://github.com/tranquilit/pltis_uicomponents.git'
  'git+https://github.com/tranquilit/pltis_utils.git'
  'git+https://github.com/osvegn/pltis_virtualtrees.git'
  "mormot2static-$_mormot_static.tgz::https://github.com/synopse/mORMot2/releases/download/$_mormot_static/mormot2static.tgz"
  'openrsat.desktop'
  'utheme-lclgtk2.patch'
)
noextract=("mormot2static-$_mormot_static.tgz")
sha256sums=('380314fac85e67e9c9765890d743924f0ead11b179bb2287d7f848f0024f3499'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ae2d8da212c5b4f2778370de7aee965f7fd82eef911da27eeb797d6db06db449'
            '6d34794464bcc26a71f4934c0985dc8294c95709c286de9538dcedab23a53783'
            '33c67911327794d36f173e205a6e287f02a7ef070ea63f909db19924325d9188')

prepare() {
  cd OpenRSAT

  # Submodules are pinned by the gitlinks of the tag
  git submodule init
  local _sub
  for _sub in mORMot2 metadarkstyle pltis_djoin pltis_uicomponents \
              pltis_utils pltis_virtualtrees; do
    git config "submodule.submodules/$_sub.url" "$srcdir/$_sub"
  done
  git -c protocol.file.allow=always submodule update

  mkdir -p submodules/mORMot2/static
  bsdtar -xf "$srcdir/mormot2static-$_mormot_static.tgz" \
    -C submodules/mORMot2/static

  # Arch ships the LCL precompiled for Qt5/Qt6 only, and gtk2 is no
  # longer in the official repositories: keep GTK2 out of a Qt6 build.
  patch -Np1 -i "$srcdir/utheme-lclgtk2.patch"

  # The project embeds languages/Translation.<lang>.po, which upstream
  # generates at release time with merge_po.py (project, core, GUI).
  local _lang _po
  for _lang in el en fr pl; do
    for _po in \
      "languages/OpenRSAT.$_lang.po" \
      "packages/OpenRSATCore/languages/ucommon.$_lang.po" \
      "packages/OpenRSATGUI/languages/OpenRSATGUI.$_lang.po"; do
      printf '\n'
      cat "$_po"
    done > "languages/Translation.$_lang.po"
  done

  # FPC calls ld itself and ignores LDFLAGS. lazbuild cannot add options,
  # but fpc reads ./fpc.cfg first: link with full RELRO like LDFLAGS does.
  printf '%s\n' '#INCLUDE /etc/fpc.cfg' -k-z -krelro -k-z -know \
    > sources/fpc.cfg

  # Private Lazarus configuration: ~/.lazarus is never touched, and the
  # read-only units of /usr/lib/lazarus get rebuilt under it.
  rm -rf "$srcdir/lazarus-config"
  local _lpk
  for _lpk in \
    submodules/mORMot2/packages/lazarus/mormot2.lpk \
    submodules/metadarkstyle/metadarkstyle.lpk \
    submodules/metadarkstyle/metadarkstyledsgn.lpk \
    submodules/pltis_djoin/pack/pltis_djoin.lpk \
    submodules/pltis_uicomponents/pack/pltis_uicomponents.lpk \
    submodules/pltis_utils/pltis_utils.lpk \
    submodules/pltis_virtualtrees/virtualtreeview_package.lpk \
    packages/OpenRSATCore/OpenRSATCore.lpk \
    packages/OpenRSATGUI/OpenRSATGUI.lpk; do
    lazbuild \
      --primary-config-path="$srcdir/lazarus-config" \
      --lazarusdir=/usr/lib/lazarus \
      --add-package-link "$_lpk"
  done
}

build() {
  # lazbuild resolves the project resources from the current directory
  cd OpenRSAT/sources
  lazbuild \
    --primary-config-path="$srcdir/lazarus-config" \
    --lazarusdir=/usr/lib/lazarus \
    --quiet --widgetset=qt6 --build-mode=linux-x64 \
    OpenRSAT.lpi
}

check() {
  cd OpenRSAT/tests
  lazbuild \
    --primary-config-path="$srcdir/lazarus-config" \
    --lazarusdir=/usr/lib/lazarus \
    --quiet --widgetset=qt6 --build-mode=test_linux_x64 \
    openrsattests.lpi

  # Offline unit tests only: the integration tests need a live Active
  # Directory. LoadFromKeyTab is skipped: it expects a local-time
  # timestamp while the presenter formats it in UTC.
  ./openrsattests \
    -t TTestAdvancedSecurityPresenter \
    -t TUnitTestGenerateKeyTab \
    -t TUnitTestViewKeyTabPresenter.CopyToClipboard \
    -t TUnitTestDoubleListLogic
}

package() {
  cd OpenRSAT

  install -Dm755 bin/linux-x64/OpenRSAT "$pkgdir/usr/bin/openrsat"
  install -Dm644 "$srcdir/openrsat.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 assets/icons/OpenRSAT_48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/openrsat.png"
  install -Dm644 assets/icons/OpenRSAT_512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/openrsat.png"

  # Licenses that are not plain common texts (exceptions, copyright
  # notices). GPL, LGPL and MPL texts come with the licenses package.
  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  local _crypt=submodules/mORMot2/src/crypt
  install -Dm644 submodules/mORMot2/LICENCE.md "$_lic/mORMot2-LICENCE.md"
  install -Dm644 submodules/pltis_djoin/LICENCE.md "$_lic/pltis_djoin-LICENCE.md"
  install -Dm644 submodules/mORMot2/res/static/libdeflate/COPYING \
    "$_lic/libdeflate-COPYING"
  install -Dm644 /usr/lib/fpc/src/rtl/COPYING.FPC "$_lic/COPYING.FPC"
  install -Dm644 /usr/share/licenses/lazarus/COPYING.modifiedLGPL \
    "$_lic/COPYING.modifiedLGPL"
  install -Dm644 /usr/lib/fpc/src/packages/paszlib/readme.txt \
    "$_lic/paszlib-readme.txt"
  install -Dm644 /usr/lib/fpc/src/packages/pasjpeg/readme.txt \
    "$_lic/pasjpeg-readme.txt"
  # Notices that only exist as source comments in mORMot2
  sed -n '/ISCSI CRC 32 Implementation/,/SUCH DAMAGE/p' \
    "$_crypt/mormot.crypt.core.asmx64.inc" > "$_lic/intel-sse4-BSD-3-Clause"
  sed -n '/AES_PASCAL version (c) Wolfgang Ehrhardt/,/from any source distribution/p' \
    "$_crypt/mormot.crypt.core.pas" > "$_lic/ehrhardt-Zlib"
  test -s "$_lic/intel-sse4-BSD-3-Clause"
  test -s "$_lic/ehrhardt-Zlib"
}
