# Maintainer: valvetime <valvetimepackages@gmail.com>

pkgname=osmo-tetra-sq5bpf-git
pkgver=7c1a853
pkgrel=1
epoch=3
pkgdesc="TETRA receiver / decoder (sq5bpf's fork). Uses gnuradio. See http://www.rtl-sdr.com/rtl-sdr-tutorial-listening-tetra-radio-channels/ for usage instructions."
arch=('any')
url="https://github.com/sq5bpf/osmo-tetra-sq5bpf"
license=('AGPLv3')
depends=('libosmocore' 'gnuradio' 'gnuradio-companion' 'python2')
optdepends=('telive: extract audio from the received data')
makedepends=('git')
source=(${pkgname}::"git+https://github.com/sq5bpf/osmo-tetra-sq5bpf")
sha256sums=('SKIP')


build() {        

#the actual building

cd "${srcdir}/${pkgname}/src"
        
        make -j4


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


#we need to apply patches because currently gnuradio has no support for python 3, however arch ships it as default
#feel free to comment this out once support for python 3 is added into gnuradio


# create a patch file
# I stole this from http://www.linuxquestions.org/questions/programming-9/how-do-i-make-a-text-file-in-bash-517070/

cat > python.diff << EOF
1c1
< #!/usr/bin/env python
---
> #!/usr/bin/python2
EOF

#sigh... time to do the patching

#lets start with the src/demod/python dir
cd "${srcdir}/${pkgname}/src/demod/python"

patch tetra-demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch fcdp-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch fcdp-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch osmosdr-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch simdemod2.py < "${srcdir}/${pkgname}/src/python.diff"
patch uhd-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp1-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp2-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"



#phew... now onto src/demod/python-3.6

cd "${srcdir}/${pkgname}/src/demod/python-3.6"

patch fcdp-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch fcdp-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch osmosdr-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch simdemod2.py < "${srcdir}/${pkgname}/src/python.diff"
patch tetra-demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch uhd-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp1-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp2-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"



#done
# Now onto src/demod/python-3.7

cd "${srcdir}/${pkgname}/src/demod/python-3.7"

patch fcdp-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch fcdp-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch osmosdr-tetra_demod_fft.py < "${srcdir}/${pkgname}/src/python.diff"
patch simdemod2.py < "${srcdir}/${pkgname}/src/python.diff"
patch tetra-demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch uhd-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp1-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"
patch usrp2-tetra_demod.py < "${srcdir}/${pkgname}/src/python.diff"


#Finished!


}

package() {

#I am sorry to offend the linux gods by creating a top level directory, but unfortunately telive refuses to cooperate nicely otherwise
mkdir -p $pkgdir/tetra
cd $srcdir
cp -r "osmo-tetra-sq5bpf-git" "$pkgdir/tetra"

#make it writeable by members of group wheel (aka sudoers on most setups)
chown  -R :wheel /$pkgdir/tetra

}
