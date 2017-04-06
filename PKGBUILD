# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Enable SELinux support?
build_selinux=false

pkgname=oddjob
pkgver=0.34
pkgrel=1
pkgdesc="A D-Bus service which runs odd jobs on behalf of client applications"
arch=(i686 x86_64)
url="https://releases.pagure.org/oddjob/"
license=(BSD)
depends=(cyrus-sasl dbus krb5 libxml2 openldap pam python2 systemd)

if [[ "${build_selinux}" == "true" ]]; then
  depends+=(selinux-usr-libselinux)
fi

backup=(etc/oddjobd.conf.d/oddjobd-introspection.conf
        etc/oddjobd.conf.d/oddjobd-mkhomedir.conf
        etc/oddjobd.conf)
options=(!libtool)
install=${pkgname}.install
source=("https://releases.pagure.org/oddjob/${pkgname}-${pkgver}.tar.gz")
sha512sums=('df62a58f86087542876d614c084ec260861a7666bc267747ea45b063d000995f19d275cbc9c09a91dd7adf964f2297bf01a2a0f85339f157817c49bdbafaafab')

if [[ "${build_selinux}" == "false" ]]; then
  source+=(0001_Remove_SELinux_support.patch)
  sha512sums+=('2a9a1ffaaf875c66844e3795f65a2efe2f054860734214ff41eaefdf9355137dbf81a5edf54ee735f4c8c70ee430ee96bc801adf365afc0e5eda5290632acdda')
fi

build() {
  cd "${pkgname}-${pkgver}"

  SELINUX_OPTIONS=""
  if [[ "${build_selinux}" == "true" ]]; then
    SELINUX_OPTIONS="--with-selinux-acls --with-selinux-labels"
  else
    patch -p1 -i ../0001_Remove_SELinux_support.patch
    aclocal --force --install
    autoreconf -vfi
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/${pkgname} \
    --disable-static \
    --enable-pie \
    --enable-now \
    ${SELINUX_OPTIONS} \
    --without-python \
    `# --enable-xml-docs` \
    `# --enable-compat-dtd` \
    --enable-systemd \
    --disable-sysvinit

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
