# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

_hash='191fece'
pkgname='openshift-origin-server-bin'
pkgver='3.9.0'
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
sha512sums=(
    'dc005d316e4cb0be1cedf583c7d4b0b535d989a655a92a91acefd0eff45a74e5529c14827a1706b220b4c52e40579204364a1e6d2360eef89d5f59bc4777ec29'
    '584c1730d553106f4b57a0eb1d601f050e5323a91e5dac22c39a3001d009ca331e93184aa5058f1defc64d4d9ae596d231a84f639a079bed668fe71c333c1080'
    'e871b6165c7e1c728c8544c86391fa46fe1969ed1bc490c6e0e139c9caa06ea8854b41eedd33afc2bcb83288eb2c6fba675d6e4b48f3ff03163f017f6c6a0337'
    '93bda923209f2676b165df4a4e74e612e4826af0eaf21719ef5567d970b091170b380b562b39b5daf3b95bb5d88ce8f7f96af6cc76401ad1ac7e656979fa74a9'
    '26d9489c3e2d2a061337bcd162610b637b256c18af70d9f6d5f2fe538471eb02f2c56fb0fee7cf41f21118621c0afafd52aa91aa8ae5ed78770ae7bdc21a4e2d'
)

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
