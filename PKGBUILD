# Maintainer: Tikilou <tikilou@hotmail.fr>
pkgname=compress-pdf-gui
pkgver=1.0
pkgrel=1
pkgdesc="A GUI script to compress PDF files using Zenity and Ghostscript in French"
arch=('any')
license=('MIT')
depends=('ghostscript' 'zenity' 'bc' 'coreutils')
source=()
sha256sums=()

package() {
    install -Dm755 "$srcdir/compress_pdf_gui.sh" "$pkgdir/usr/bin/compress_pdf_gui"
}

build() {
    cat << 'EOF' > "$srcdir/compress_pdf_gui.sh"
#!/bin/bash

# Fonction pour afficher une erreur
show_error() {
    zenity --error --text="$1"
    exit 1
}

# Demander à l'utilisateur de sélectionner un fichier PDF
input_pdf=$(zenity --file-selection --title="Sélectionnez un fichier PDF à compresser")

# Vérifier si un fichier a été sélectionné
if [ -z "$input_pdf" ]; then
    show_error "Aucun fichier sélectionné."
fi

# Demander à l'utilisateur de sélectionner la qualité de compression
quality=$(zenity --scale --text="Sélectionnez le niveau de qualité de compression (1-10)" --min-value=1 --max-value=10 --value=5)

# Vérifier si une qualité a été sélectionnée
if [ -z "$quality" ]; alors
    show_error "Aucune qualité sélectionnée."
fi

# Définir le niveau de compression en fonction de la qualité
if [ "$quality" -le 1 ]; alors
    pdf_settings="/screen"
elif [ "$quality" -le 3 ]; alors
    pdf_settings="/ebook"
elif [ "$quality" -le 6 ]; alors
    pdf_settings="/printer"
else
    pdf_settings="/prepress"
fi

# Définir le nom du fichier de sortie
output_pdf="${input_pdf%.*}_compressed.pdf"

# Compresser le PDF
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$pdf_settings -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output_pdf" "$input_pdf"

# Vérifier si la compression a réussi
if [ $? -ne 0 ]; alors
    show_error "Erreur lors de la compression du fichier PDF."
fi

# Afficher un message de succès
filesize=$(stat -c%s "$output_pdf")
filesize_mb=$(echo "scale=2; $filesize / 1048576" | bc)
zenity --info --text="Compression réussie : Le fichier compressé est de $filesize_mb Mo"
EOF
}
