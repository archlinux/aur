# Maintainer: Philipp Schmitt <philipp@schmitt.co>
_pkgname="nzbmegasearch"
pkgname="nzbmegasearch-git"
pkgver=v0.46.r3.g24b5e5b
pkgrel=2
pkgdesc="Aggregate automatically NZB search results. Easy. Quick. Clean."
arch=(any)
url="http://pillone.github.io/usntssearch"
license=('unknown')
depends=('python2' 'python2-pyopenssl')
install='nzbmegasearch.install'
source=("nzbmegasearch::git+https://github.com/pillone/usntssearch.git#branch=master"
        "nzbmegasearch.service"
        "nzbmegasearch.sh"
        "nzbmegasearch.install")
md5sums=('SKIP'
         '4306737c089e52ec03500aa953f060d7'
         'dfb6224058ffefcb9f9043528fef1c8d'
         '40768a064264be83e605e209616f1e85')
sha1sums=('SKIP'
          'b1f883a410c61b4d1d2b3c4cc2429f2dd4429e27'
          '08ee33416b1839427586a9bcb36f39b9c8779ffd'
          '3a8e87f04bbd8dc06893bf6a3b1883d40838248f')
sha256sums=('SKIP'
            '5ecfdaefbe5486962474a7a704e456f48564db2ec90c417ad831d530a5dd5cf1'
            'f865904bbeda3a4f049533f5920d05b5d27fb595013e6c3b7ce2c0b671f94924'
            'fdddb4047513fe9d16625cf50012c60eac6780d6278b1151e82cd7c541dc9b28')
sha512sums=('SKIP'
            '5c524246e5a0fb7f51cbc22f78d0ca2d620fd886128cfcd59aa82426272fb73523897b455071488f3291124e83590a254426c5d07611d540926ef62a8543a2ec'
            'e04f9cbac611b4daf8f7f96dffda354d8903c2500539d00ffb646f0da9fbb1ffdda6e8a8bf6846c69850e01fe7d31abffe1d5441b0699ec87cd777928a69ad7e'
            'f619d442a8d2884b24e5509e191bd8385804e91e76f764198fc928326581821effa7655c9915658c5b5cce942882c611b5e54de113bf867251e58ac90e2db570')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"

    msg2 "Install NZBmegasearch to /opt/nzbmegasearch"
    install -d -D -m 755 "${pkgdir}/opt/nzbmegasearch"
    cp -dpr --no-preserve=ownership "${srcdir}/nzbmegasearch/NZBmegasearch/"* "${pkgdir}/opt/nzbmegasearch"

    msg2 "Install log directory to ~nzbmegasearch/logs"
    rm -rf "${pkgdir}/opt/nzbmegasearch/logs"
    install -d -D -m 755 "${pkgdir}/var/lib/nzbmegasearch/logs"
    ln -s /var/lib/nzbmegasearch/logs "${pkgdir}/opt/nzbmegasearch/logs"

    msg2 "Install custom_params.ini to ~nzbmegasearch/custom_params.ini"
    rm -rf "${pkgdir}/opt/nzbmegasearch/custom_params.ini"
    ln -s /var/lib/nzbmegasearch/custom_params.ini "${pkgdir}/opt/nzbmegasearch/custom_params.ini"

    msg2 "Install executable into /usr/bin"
    install -D -m 755 "${srcdir}/nzbmegasearch.sh" "${pkgdir}/usr/bin/nzbmegasearch"

    msg2 "Install nzbmegasearch.service"
    install -D -m 644 "${srcdir}/nzbmegasearch.service" "${pkgdir}/usr/lib/systemd/system/nzbmegasearch.service"
}

