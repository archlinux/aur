# Maintainer:  Aaron Miller <aaronm@cldtk.com>
# Contributor: Paul Wilk <paul.wilk@null.net>
# Contributor: ReNoM <renom@list.ru>
# Contributor: Jiri Novak <jiri.bati.novak@gmail.com>

pkgname=vmware-vcli
_pkgver=6.7.0-8156551
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="VMware vSphere Command-Line Interface (vCLI); run commands against vSphere and ESX/ESXi"
arch=('i686' 'x86_64')
url="https://code.vmware.com/web/tool/6.7/vsphere-cli"
license=('custom:vmware')
depends=(e2fsprogs openssl libxml2 perl kmod krb5
  perl-xml-libxml perl-bytes-random-secure perl-crypt-ssleay perl-xml-sax
  perl-archive-zip perl-html-parser perl-data-dump perl-soap-lite perl-uri
  perl-lwp-protocol-https perl-class-methodmaker perl-net-ssleay
  perl-text-template perl-uuid)
install=$pkgname.install
source=(for-arch.patch)
source_i686=(local://VMware-vSphere-CLI-$_pkgver.i386.tar.gz)
source_x86_64=(local://VMware-vSphere-CLI-$_pkgver.x86_64.tar.gz)
md5sums=('645541c36349779a7f580e4a5b8453d3')
md5sums_i686=('97df2464063c23bd87c5a8ed7e4871ef')
md5sums_x86_64=('b38f05c522547c7377326e915597bdf7')
options=(!strip docs libtool staticlibs emptydirs !zipman !purge !debug)

build() {
  cd "vmware-vsphere-cli-distrib"

  chmod +w bin/vmware-uninstall-vSphere-CLI.pl

  patch -Np0 < ../for-arch.patch
  sed -i "s/my \$e2fsprogs_version = '0'/my \$e2fsprogs_version = '$(tune2fs 2>/dev/null | awk 'FNR == 1 {print $2}')'/" bin/vmware-uninstall-vSphere-CLI.pl

  chmod -w bin/vmware-uninstall-vSphere-CLI.pl
}

package() {
  cd "vmware-vsphere-cli-distrib"

  mkdir -p "$pkgdir"/usr/bin

  ./vmware-install.pl --prefix="$pkgdir"

  mv "$pkgdir"/bin/* "$pkgdir"/usr/bin
  rmdir "$pkgdir"/bin
  mkdir "$pkgdir"/usr/lib
  mv "$pkgdir"/lib/vmware-vcli "$pkgdir"/usr/lib/vmware-vcli
  rmdir "$pkgdir"/lib

  mv "$pkgdir"/usr/share/perl5/core_perl/ "$pkgdir"/usr/share/perl5/vendor_perl/

  chmod +x "$pkgdir"/usr/lib/vmware-vcli/bin/esxcli/esxcli

  # Having this causes some python programs to throw errors and this seems
  # OK without it
  rm "$pkgdir"/usr/bin/six.pyc

  # Fix location config
  sed "s:^file .*/pkg/vmware-vcli:file /usr:" \
    -i "$pkgdir"/etc/vmware-vcli/locations
  sed "s:^directory .*/pkg/vmware-vcli:directory /usr:" \
    -i "$pkgdir"/etc/vmware-vcli/locations
  sed "s:LIBDIR .*/pkg/vmware-vcli:LIBDIR /usr:" \
    -i "$pkgdir"/etc/vmware-vcli/locations
  sed "s:BINDIR .*/pkg/vmware-vcli:BINDIR /usr:" \
    -i "$pkgdir"/etc/vmware-vcli/locations
  sed "s:DOCDIR .*/pkg/vmware-vcli:DOCDIR /usr:" \
    -i "$pkgdir"/etc/vmware-vcli/locations
  sed "s:^libdir .*:/usr/lib/vmware-vcli:" \
    -i "$pkgdir"/etc/vmware-vcli/config
}
