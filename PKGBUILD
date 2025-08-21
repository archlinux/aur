# MAINTAINER: Noble Eugene <nobleeugene2005@gmail.com>
# https://www.github.com/eugenenoble2005/avalonia-ls.git

pkgname="avalonia-ls-git"
pkgver=1.02
pkgrel=1
pkgdesc="Unofficial Standalone LSP for Avalonia Projects. Plus XamlStyler for formatting."
arch=(any)
makedepends=("dotnet-sdk" "git")
depends=("dotnet-runtime")
url="https://www.github.com/eugenenoble2005/ls-for-avalonia"
source=("git+https://github.com/eugenenoble2005/ls-for-avalonia")
sha256sums=("SKIP")

prepare(){
	cd $srcdir/ls-for-avalonia
	git submodule update --init
}
package(){
	cd $srcdir/ls-for-avalonia
    mkdir -p bin/lsp
    #I have to build with one CPU core here because Arch Linux is retarded and keeps killing the process
    dotnet build src/AvaloniaLSP/AvaloniaLanguageServer --output bin/lsp -m:1
     
    mkdir -p bin/solution-parser
    dotnet build src/SolutionParser/SolutionParser.csproj --output bin/solution-parser

    mkdir -p bin/xaml-styler
    dotnet build src/XamlStyler/src/XamlStyler.Console/XamlStyler.Console.csproj --output bin/xaml-styler

    mkdir -p bin/avalonia-preview
    dotnet build src/AvaloniaPreview --output bin/avalonia-preview  -m:1

    install -d -m 755 "$pkgdir/usr/lib/avalonia-ls" && cp -r bin/* "$pkgdir/usr/lib/avalonia-ls"
    
    install -d -m 755 "$pkgdir/usr/bin"
    echo -e "#!/bin/bash\n exec /usr/lib/avalonia-ls/xaml-styler/xstyler \"\$@\"" > $pkgdir/usr/bin/xaml-styler
    chmod +x $pkgdir/usr/bin/xaml-styler

    echo -e "#!/bin/bash\n exec /usr/lib/avalonia-ls/lsp/AvaloniaLanguageServer \"\$@\"" > $pkgdir/usr/bin/avalonia-ls
    chmod +x $pkgdir/usr/bin/avalonia-ls
    
    echo -e "#!/bin/bash\n exec /usr/lib/avalonia-ls/solution-parser/SolutionParser \"\$@\"" > $pkgdir/usr/bin/avalonia-solution-parser
    chmod +x $pkgdir/usr/bin/avalonia-solution-parser
    
    echo -e "#!/bin/bash\n exec /usr/lib/avalonia-ls/avalonia-preview/AvaloniaPreview \"\$@\"" > $pkgdir/usr/bin/avalonia-preview
    chmod +x $pkgdir/usr/bin/avalonia-preview

}

