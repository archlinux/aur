# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=3.0.2
pkgrel=1
pkgdesc="PufferPanel: A web-base game management system (binary version)."
arch=('x86_64' 'aarch64')
url="https://github.com/PufferPanel/PufferPanel"
license=('Apache')
provides=('pufferpanel')
conflicts=('pufferpanel')
optdepends=('nginx: TLS support'
			'postgresql: Dedicated database'
			'docker: Container support'
                        'sqlite: Database support')
depends=()
source_aarch64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_arm64.deb)
source_x86_64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_amd64.deb)
b2sums_x86_64=('e41dde5f7c29928171d33a0b85da92599d91889ec0fd158ef611e3a9193c1119faffb30f30f9b1b235f37214ea282126fc84ca1e7d2c8ab861e2417ab54c4b78')
b2sums_aarch64=('667aea3424c996c250cc89e86826f572230ee8a54c4f5e42ee9e23057a66d4bf762e5074a24e02c6a138f83d5bbf2641ec2777c2b44c9119a3f8a6cf64b9e53d')
package() {
  # Check openat2 exists; some other _not arch_ distros don't have this for whatever reason (like catchy)
  #if cat /proc/kallsyms | grep do_sys_openat2zzz == false; then echo Missing openat2 support, cannot install. ; exit 1; fi
   if !  /proc/kallsyms | grep do_sys_openat2zzz ; then
      echo "Need openat2"
      exit 1
   fi

  tar -xJf control.tar.xz
  tar -xJf data.tar.xz

  export pkg=pufferpanel
  install -D -m 755 "${srcdir}/etc/pufferpanel/config.json" "${pkgdir}/etc/pufferpanel/config.json"
  install -D -m 755 "${srcdir}/lib/systemd/system/pufferpanel.service" "${pkgdir}/usr/lib/systemd/system/pufferpanel.service"
  install -D -m 755 "${srcdir}/usr/sbin/pufferpanel" "${pkgdir}/usr/bin/pufferpanel"
  mkdir -p ${pkgdir}/var/lib/${pkg}/binaries ${pkgdir}/var/log/${pkg}
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
