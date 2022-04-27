# Copyright (C) 2021 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the CC0 1.0 License.

pkgname=fomu-verilog-blink
pkgver=0.1
pkgrel=1
pkgdesc="Blink test firmwares for the FOMU FPGA boards"
arch=('any')
url='https://github.com/im-tomu/fomu-workshop.git'
license=('Apache')
makedepends=('dfu-util'
             'icestorm-git'
             'nextpnr-git'
             'yosys')
optdepends=('dfu-util: for loading the fimrwares')
source=("https://github.com/im-tomu/fomu-workshop/archive/v${pkgver}.tar.gz"
        "LICENSE") # The commit f1c0014 which is right after the v0.1 tag adds the license
sha512sums=('f5a68839a91178e9a3238ba097eec4f6768da691cc0c934619d23ea6d3b964a305f3c831fabecdfa5d12977d9c243a8005e5fa38ddcfd3a5e391d5581e6ab709'
            'SKIP')

build(){
  cd "$srcdir/fomu-workshop-${pkgver}/verilog-blink"

  for revision in evt1 evt2 evt3 pvt1 hacker ; do
    make FOMU_REV="${revision}"
    cp blink.dfu blink-${revision}.dfu
  done
}

package(){
  cd "$srcdir/fomu-workshop-${pkgver}/verilog-blink"

  install -d "${pkgdir}/usr/share/${pkgname}/"

  for revision in evt1 evt2 evt3 pvt1 hacker ; do
    install blink-${revision}.dfu "${pkgdir}/usr/share/${pkgname}/"
  done

  install -d                "${pkgdir}/usr/share/licenses/${pkgname}/"
  install ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
