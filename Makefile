# kmailpt makefile
#

PREFIX = $(DESTDIR)usr/local/
ICOPREFIX = $(DESTDIR)usr/share/icons/

INSTALL = install --group=0 --owner=0 --mode=0755
INSTALL2 = install --group=0 --owner=0 --mode=0644

install: kmailpt.pl attach_delete.png attach_save.png
	mkdir -p $(PREFIX)bin/ $(ICOPREFIX) ; \
	$(INSTALL) kmailpt.pl $(PREFIX)bin/ ; \
	$(INSTALL2) attach_delete.png $(ICOPREFIX) ; \
	$(INSTALL2) attach_save.png $(ICOPREFIX)
