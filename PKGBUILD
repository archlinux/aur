# Maintainer:  Jonathan Steel <jsteel at archlinux.org>
# Contributor: ReNoM <renom@list.ru>

pkgname=vmware-vcli
_pkgver=6.0.0-3561779
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="VMware vSphere Command-Line Interface (vCLI); run commands against vSphere and ESX/ESXi"
arch=('i686' 'x86_64')
url="https://developercenter.vmware.com/tool/vsphere_cli/6.0"
license=('custom:vmware')
depends=(e2fsprogs openssl libxml2 perl kmod krb5
  perl-xml-libxml perl-bytes-random-secure perl-crypt-ssleay perl-xml-sax
  perl-archive-zip perl-html-parser perl-data-dump perl-soap-lite perl-uri
  perl-lwp-protocol-https perl-class-methodmaker perl-net-ssleay )
install=$pkgname.install
source=(for-arch.patch)
source_i686=(local://VMware-vSphere-CLI-$_pkgver.i386.tar.gz)
source_x86_64=(local://VMware-vSphere-CLI-$_pkgver.x86_64.tar.gz)
md5sums=('c46fcc7bac0d9b0c710f52cfe286d34a')
md5sums_i686=('b54d011f10525044abac1876006245b0')
md5sums_x86_64=('ea5e46142bc342558150f52da21aaf5e')

build() {
  cd "vmware-vsphere-cli-distrib"
  patch -Np0 < ../for-arch.patch
}

package() {
  cd "vmware-vsphere-cli-distrib"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/perl5/core_perl

  ./vmware-install.pl --prefix="$pkgdir"

  rm "$pkgdir"/usr/lib/perl5/core_perl/Data/Dumper.pm
  rm "$pkgdir"/usr/lib/perl5/core_perl/auto/Data/Dumper/Dumper.so
  rm -rf "$pkgdir"/usr/lib/perl5/core_perl/MIME/
  rm -rf "$pkgdir"/usr/lib/perl5/core_perl/auto/MIME/

  mv "$pkgdir"/bin/* "$pkgdir"/usr/bin/
  rmdir "$pkgdir"/bin
  mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/
  rmdir "$pkgdir"/lib

  chmod +x "$pkgdir"/usr/lib/vmware-vcli/bin/esxcli/esxcli
}
