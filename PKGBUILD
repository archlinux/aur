# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=crossdock-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Publish packages as signed apt, pacman, RPM and GooGet repositories (with server and systemd units) (Pre-compiled Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/crossdock"
license=('GPL-3.0-or-later')
optdepends=('gnupg: sign with a GnuPG keyring or smartcard (signing.gnupg_home)'
            'firewalld: the bundled crossdock service definition')
provides=("crossdock=${pkgver}")
conflicts=('crossdock')
backup=('etc/crossdock/crossdock.yaml')
# The release binaries are static and already stripped: nothing to strip and
# no debug info to split out.
options=('!strip' '!debug')
# Repackaged from the release's .deb files, as upstream's
# build-aux/arch/crossdock-bin does (static binary, systemd units, and the
# sysusers.d and tmpfiles.d entries, which pacman's hooks apply); the sums
# match the release's SHA256SUMS.txt and GitHub's published asset digests.
source_x86_64=("crossdock-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/crossdock-amd64.deb")
source_aarch64=("crossdock-${pkgver}-arm64.deb::${url}/releases/download/v${pkgver}/crossdock-arm64.deb")
sha256sums_x86_64=('de1aa0da67337017ab89ef8846be3a85eab96b7a180a9f02cf48f41306c119a0')
sha256sums_aarch64=('74892b0b340a0fd0624862bd54ce53d4e096dc356dbfd2bd4f47c440e50cdff7')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}"
  # Arch keeps license texts in the licenses package (GPL-3.0 is there);
  # drop Debian-only files.
  rm -rf "${pkgdir}/usr/share/lintian" \
    "${pkgdir}/usr/share/doc/crossdock/changelog.gz" \
    "${pkgdir}/usr/share/doc/crossdock/copyright"
}
