# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=winexe
pkgver=4.24.3
pkgrel=2
pkgdesc='Remote Windows command executor via SMB (from samba/examples/winexe)'
arch=('x86_64')
url='https://www.samba.org/'
license=('GPL3')
install=winexe.install

# ABI lock: winexe links against /usr/lib/samba/lib*-private-samba.so shipped
# by the official samba package, so the version should match exactly.
# The "2:" prefix is samba's epoch (it has used epoch=2 since 2012).
_sambaepoch=2
depends=("samba=${_sambaepoch}:${pkgver}")

# We use the MSVCRT-targeted mingw-w64 toolchain (from AUR) so the embedded
# winexesvc.exe service binaries link against msvcrt.dll and therefore run 
# on every Windows since NT 4.0 SP6. The UCRT-based mingw-w64-gcc in [extra] 
# would limit support to Windows 10+ (or Vista/7/8 with KB2999226). 
makedepends=(
  'mingw-w64-gcc-msvcrt'
  'perl-parse-yapp'
  'cmocka'
  'bison'
  'flex'
  'patchelf'
)

_sambapkg=samba
source=(
  "https://download.samba.org/samba/ftp/stable/${_sambapkg}-${pkgver}.tar.gz"
  "https://download.samba.org/samba/ftp/stable/${_sambapkg}-${pkgver}.tar.asc"
  'NOTES'
  'winexe.install'
)
validpgpkeys=('81F5E2832BD2545A1897B713AA99442FB680B620') # Samba Distribution Verification Key
sha256sums=('4a5e0ed1ea192b798c873d9957c50a5767c10c2767cccb00d56ecc427e94f8e9'
            'SKIP'
            '989cee777ca19230f03623357e9bdc8eb33fce17230790c466aa013ecc6c9ba9'
            'cbd542ccd943ae95fb856ba7850ebc1ab5b03da5fe0649dafc989dd3b5bd77a0')

build() {
  cd "${srcdir}/${_sambapkg}-${pkgver}"

  local _samba_private_version=
  if [[ -r /usr/lib/samba/libreplace-private-samba.so ]]; then
    _samba_private_version=$(
      readelf --version-info /usr/lib/samba/libreplace-private-samba.so |
        perl -ne 'print "$1\n" and exit if /Name: (SAMBA_[^ ]+_PRIVATE_SAMBA)/'
    )
  fi

  # Temporary workaround for Arch shipping samba 4.24.3 with a stale private
  # ABI tag. When present, match the tag exported by the installed private
  # libraries so winexe keeps working until the samba package is corrected.
  perl -0pi -e 's/conf\.env\.PRIVATE_VERSION = "%s_%s_%s" % \(Context\.g_module\.APPNAME,\s*Context\.g_module\.VERSION, conf\.env\.PRIVATE_EXTENSION\)/conf.env.PRIVATE_VERSION = os.environ.get("SAMBA_PRIVATE_VERSION") or "%s_%s_%s" % (Context.g_module.APPNAME,\n        Context.g_module.VERSION, conf.env.PRIVATE_EXTENSION)/s' \
    buildtools/wafsamba/wscript

  # Mirror the configure flags from the official Arch `samba` PKGBUILD so the
  # winexe binary we produce is ABI-compatible with /usr/lib/samba/*.so on
  # the user's system. The only addition is --with-winexe.
  local _samba4_idmap_modules=idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2
  local _samba4_pdb_modules=pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4
  local _samba4_auth_modules=auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4

  SAMBA_PRIVATE_VERSION="${_samba_private_version}" ./configure --enable-fhs \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/samba \
    --localstatedir=/var \
    --with-configdir=/etc/samba \
    --with-lockdir=/var/cache/samba \
    --with-sockets-dir=/run/samba \
    --with-piddir=/run \
    --with-ads \
    --with-ldap \
    --with-winbind \
    --with-acl-support \
    --with-systemd \
    --with-pam \
    --with-pammodulesdir=/usr/lib/security \
    --private-libraries='!ldb' \
    --bundled-libraries='!tdb,!talloc,!pytalloc-util,!tevent,!popt,!pyldb-util' \
    --with-shared-modules="${_samba4_idmap_modules},${_samba4_pdb_modules},${_samba4_auth_modules},vfs_io_uring" \
    --disable-rpath-install \
    --with-profiling-data \
    --with-winexe

  PYTHONHASHSEED=1 ./buildtools/bin/waf build --targets=winexe -j"$(nproc)"
}

package() {
  cd "${srcdir}/${_sambapkg}-${pkgver}"

  install -Dm755 bin/default/examples/winexe/winexe \
    "${pkgdir}/usr/bin/winexe"
  
  mkdir -p "${pkgdir}/usr/share/man/man1"
  gzip -c docs/manpages/winexe.1 > "${pkgdir}/usr/share/man/man1/winexe.1.gz"

  # The build directory's RUNPATH is baked in; rewrite it to point at the
  # samba package's private library directory.
  patchelf --set-rpath /usr/lib/samba "${pkgdir}/usr/bin/winexe"

  install -Dm644 examples/winexe/README \
    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "${srcdir}/NOTES" \
    "${pkgdir}/usr/share/doc/${pkgname}/NOTES"
}
