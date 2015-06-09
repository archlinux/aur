# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=ldapjdk
pkgver=4.18
pkgrel=3
pkgdesc="The Mozilla LDAP Java SDK"
arch=(any)
url="http://www.mozilla.org/directory/javasdk.html"
license=(Mozilla GPL LGPL)
depends=(java-runtime jss)
makedepends=(apache-ant java-environment)
# Fedora kindly hosts a tarball of a cvs snapshot
source=("http://pkgs.fedoraproject.org/repo/pkgs/ldapjdk/ldapjdk-4.18.tar.gz/5c37162e72acba3a224c5f3e434c7bdc/ldapjdk-4.18.tar.gz"
        # Patches from Fedora
        ldapjdk-jarnamefix.patch
        matching-rule-parsing-640750.patch)
sha512sums=('602ae335ce1f3a6dda14d10d297f3145b234171d0afc21f6b048c0310e1873c7cef22d9ef1c00a03b676f79966470ebd04a0d2d07720759490339ee7e691e3a4'
            '4bf9210816e4040c5303f136448afa32561e6c0d967d3e8f0e502fd1282f81ffabfa55190bbbb1433301bb3690965f27ff90ea3b1fb60eb07161fd9b76bc7ec2'
            '177aa9ac1687618f8158810c84c52a2d5c4ec6b92cdefd2c9a8588eded035935b441038de02c614d958354f296e7e7723b3306f5f305e2d6e426681d8079f1d2')

build() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../ldapjdk-jarnamefix.patch
  patch -p1 -i ../matching-rule-parsing-640750.patch

  find . -type f -name '*.jar' -delete

  # cleanup CVS dirs
  rm -fr $(find . -name CVS -type d)
  # Link to build-system BRs
  ln -s /usr/lib/java/jss4.jar ./mozilla/directory/java-sdk/ldapjdk/lib/
  cd mozilla/directory/java-sdk

  ant dist
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 mozilla/directory/java-sdk/dist/packages/{ldapjdk,ldapsp,ldapfilt,ldapbeans}.jar \
    "${pkgdir}/usr/share/java/"
}
