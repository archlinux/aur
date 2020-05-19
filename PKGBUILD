# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

_hash='0cbc58b'
pkgname='openshift-origin-server-bin'
pkgver='3.11.0'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=(
    "bash-completions-oc::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
    "bash-completions-openshift::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/openshift"
    "zsh-completions-oc::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc"
    "zsh-completions-openshift::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/openshift"
    "https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-server-v$pkgver-$_hash-linux-64bit.tar.gz"
)
sha512sums=('362ff81995d27b7ed204f9a6dff92a75ebc920dbc3fa3a8ed775cd9ed642c393e2f09819f1d1b2d3ecd31af7010575ea36364623b83ad2c249c5e3cae3756123'
            'fb2e3f9c3df7ffb6f924a46f4a389390276f16862585f7bc6f4cedb5a73fd5df8d897f4236b0a9a35efa5e13e2ef7d108b904379907bc3c5f5c904410c494f6b'
            '69cccd2b6aa1ca63adb7e70ab63fd203ccd5d9bf12485d3fe42ba675cd51216d3d0e0566e03e83ef68f25b682e63595f078a99b1084a65cdec4f5463410c9a51'
            'd369e1e3484b253800707d2aa312179d6b3a2553b952e7d4d60453a633b97411c24a07d055924c94ca095803d3325b9d8d05c6a0d7e914d8fe6c5d639299c665'
            '9d85f343ec5538abaef91634331c5eb37351e7af5d327f3a6924c2b61d5a5d7e8e22b64585431e44e16ed6c536bd2a79eb17f3085d5f86654337512ed995f653')

# keep symbols
options=(!strip)

# skip compression
PKGEXT='.pkg.tar'

prepare() {
    # Fix zsh completion
    sed -i '1i#compdef oc'        $srcdir/zsh-completions-oc
    sed -i '1i#compdef openshift' $srcdir/zsh-completions-openshift
}

package() {
    # completions
    install -D -m644 $srcdir/bash-completions-oc        $pkgdir/usr/share/bash-completion/completions/oc
    install -D -m644 $srcdir/bash-completions-openshift $pkgdir/usr/share/bash-completion/completions/openshift
    install -D -m644 $srcdir/zsh-completions-oc         $pkgdir/usr/share/zsh/site-functions/_oc
    install -D -m644 $srcdir/zsh-completions-openshift  $pkgdir/usr/share/zsh/site-functions/_openshift

    # package
    install -D -m755 $srcdir/*/hyperkube               $pkgdir/usr/bin/hyperkube
    install -D -m755 $srcdir/*/kubectl                 $pkgdir/usr/bin/kubectl
    install -D -m755 $srcdir/*/oadm                    $pkgdir/usr/bin/oadm
    install -D -m755 $srcdir/*/oc                      $pkgdir/usr/bin/oc
    install -D -m755 $srcdir/*/openshift               $pkgdir/usr/bin/openshift
    install -D -m755 $srcdir/*/template-service-broker $pkgdir/usr/bin/template-service-broker

    # symbolic links
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-apiserver
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-controller-manager
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-proxy
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kube-scheduler
    ln -s /usr/bin/openshift ${pkgdir}/usr/bin/kubelet
}
