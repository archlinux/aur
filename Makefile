# Makefile — instala/desinstala el service menu «conversor-dolphin» (KDE / KF6).
#
#   sudo make install                  # instalación normal del sistema (en /usr)
#   make install DESTDIR=/ruta/pkg     # para empaquetado (lo usa el PKGBUILD)
#   sudo make uninstall
#
# Tras instalar/desinstalar, refresca el menú de Dolphin con:
#   kbuildsycoca6  &&  (killall dolphin 2>/dev/null; true)

PREFIX  ?= /usr
DESTDIR ?=

NAME       := conversor-dolphin
SHAREDIR   := $(DESTDIR)$(PREFIX)/share
SCRIPTDIR  := $(SHAREDIR)/$(NAME)
MENUDIR    := $(SHAREDIR)/kio/servicemenus
LICENSEDIR := $(SHAREDIR)/licenses/$(NAME)

SCRIPTS := pdf-unir.sh pdf-dividir.sh pdf-convertir.sh img-a-pdf.sh office-a-pdf.sh \
           img-convertir.sh audio-convertir.sh video-convertir.sh svg-convertir.sh \
           ebook-a-pdf.sh
MENUS   := conversor-dolphin-pdf.desktop conversor-dolphin-unir.desktop \
           conversor-dolphin-imagenes.desktop conversor-dolphin-oficina.desktop \
           conversor-dolphin-audio.desktop conversor-dolphin-video.desktop \
           conversor-dolphin-svg.desktop conversor-dolphin-ebook.desktop

.PHONY: install uninstall

install:
	install -d $(SCRIPTDIR) $(MENUDIR) $(LICENSEDIR)
	install -m755 $(SCRIPTS) $(SCRIPTDIR)/
	install -m644 $(MENUS) $(MENUDIR)/
	install -m644 LICENSE $(LICENSEDIR)/

uninstall:
	rm -f $(addprefix $(SCRIPTDIR)/,$(SCRIPTS))
	rm -f $(addprefix $(MENUDIR)/,$(MENUS))
	rm -f $(LICENSEDIR)/LICENSE
	rmdir $(SCRIPTDIR) $(LICENSEDIR) 2>/dev/null || true
