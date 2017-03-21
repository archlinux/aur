ROOT := .

include $(ROOT)/tools/Makefile.common

# ALL: directories needed to make distribution
ALL_TARGETS := wserver dag2html src ged2gwb gwb2ged setup gwtp
# EVERYTHING: any other maintained project
EVERYTHING_TARGETS := gui contrib/gwpublic contrib/oneshot contrib/misc contrib/gwFix contrib/history contrib/gwdiff contrib/gwbase/etc contrib/lex

suffixed_TARGETS := $(foreach suffix,all clean depend everything opt out,$(ALL_TARGETS:=?$(suffix)) $(EVERYTHING_TARGETS:=?$(suffix)) tools?$(suffix))

.PHONY: $(suffixed_TARGETS)

all depend everything opt out: $(DEPEND_DEPEND)
all: $(ALL_TARGETS:=?all)
clean: $(ALL_TARGETS:=?clean) $(EVERYTHING_TARGETS:=?clean) tools?clean
depend: $(ALL_TARGETS:=?depend)
everything: $(ALL_TARGETS:=?everything) $(EVERYTHING_TARGETS:=?everything)
opt: $(ALL_TARGETS:=?opt)
out: $(ALL_TARGETS:=?out)

$(suffixed_TARGETS):
	$(MAKE) -C $(firstword $(subst ?, ,$@)) $(lastword $(subst ?, ,$@))

clean: clean-tmp
	$(RM) -r $(DESTDIR)

$(DEPEND_DEPEND):
	$(MAKE) -C $(dir $@) $(notdir $@)

.PHONY: install uninstall distrib

install:
	PWD=`pwd`
	if test "$(OS_TYPE)" = "Darwin"; then \
	    etc/macOS/install.command $(PWD) $(DESTDIR) etc/macOS; \
	elif test "$(OS_TYPE)" = "Win"; then \
		echo "No install for Window"; \
	else \
		mkdir -p $(PREFIX)/bin; \
		cp src/gwc1 $(PREFIX)/bin/gwc$(EXE); \
		cp src/gwc1 $(PREFIX)/bin/gwc1$(EXE); \
		cp src/gwc2 $(PREFIX)/bin/gwc2$(EXE); \
		cp src/mk_consang $(PREFIX)/bin/mk_consang$(EXE); \
		cp src/mk_consang $(PREFIX)/bin/consang$(EXE); \
		cp src/gwd $(PREFIX)/bin/gwd$(EXE); \
		cp src/gwu $(PREFIX)/bin/gwu$(EXE); \
		cp ged2gwb/ged2gwb $(PREFIX)/bin/ged2gwb$(EXE); \
		cp ged2gwb/ged2gwb2 $(PREFIX)/bin/ged2gwb2$(EXE); \
		cp gwb2ged/gwb2ged $(PREFIX)/bin/gwb2ged$(EXE); \
		cp setup/setup $(PREFIX)/bin/gwsetup$(EXE); \
		cp src/update_nldb $(PREFIX)/bin/update_nldb$(EXE); \
		mkdir -p $(LANGDIR); \
		cp -R hd/* $(LANGDIR)/.; \
		mkdir -p $(MANDIR); \
		cd man; cp $(MANPAGES) $(MANDIR)/.; \
	fi

uninstall:
	$(RM) $(PREFIX)/bin/gwc$(EXE)
	$(RM) $(PREFIX)/bin/gwc1$(EXE)
	$(RM) $(PREFIX)/bin/gwc2$(EXE)
	$(RM) $(PREFIX)/bin/mk_consang$(EXE)
	$(RM) $(PREFIX)/bin/consang$(EXE)
	$(RM) $(PREFIX)/bin/gwd$(EXE)
	$(RM) $(PREFIX)/bin/gwu$(EXE)
	$(RM) $(PREFIX)/bin/ged2gwb$(EXE)
	$(RM) $(PREFIX)/bin/gwb2ged$(EXE)
	$(RM) $(PREFIX)/bin/gwsetup$(EXE)
	$(RM) $(PREFIX)/bin/update_nldb$(EXE)
	$(RM) -r $(PREFIX)/share/geneweb
	cd $(MANDIR); $(RM) $(MANPAGES)

distribution: distrib
distrib:
	$(RM) -r $(DESTDIR)
	mkdir $(DESTDIR)
	mkdir -p $(DESTDIR)/bases
	cp CHANGES $(DESTDIR)/CHANGES.txt
	cp LICENSE $(DESTDIR)/LICENSE.txt
	cp etc/README.txt $(DESTDIR)/.
	cp etc/LISEZMOI.txt $(DESTDIR)/.
	cp etc/START.htm $(DESTDIR)/.
	if test $(OS_TYPE) = "Win"; then \
	  cp etc/Windows/gwd.bat $(DESTDIR); \
	  cp etc/Windows/gwsetup.bat $(DESTDIR); \
	  cp -f etc/Windows/README.txt $(DESTDIR)/README.txt; \
	  cp -f etc/Windows/LISEZMOI.txt $(DESTDIR)/LISEZMOI.txt; \
	elif test $(OS_TYPE) = "Darwin"; then \
	  cp etc/gwd $(DESTDIR)/gwd.command; \
	  cp etc/gwsetup $(DESTDIR)/gwsetup.command; \
	  cp etc/macOS/geneweb.command $(DESTDIR); \
	else \
	  cp etc/gwd $(DESTDIR); \
	  cp etc/gwsetup $(DESTDIR); \
	fi
	mkdir $(DESTDIR)/gw
	cp etc/a.gwf $(DESTDIR)/gw/.
	echo "127.0.0.1" > $(DESTDIR)/gw/only.txt
	echo "-setup_link" > $(DESTDIR)/gw/gwd.arg
	cp src/gwc1 $(DESTDIR)/gw/gwc$(EXE)
	cp src/gwc1 $(DESTDIR)/gw/gwc1$(EXE)
	cp src/gwc2 $(DESTDIR)/gw/gwc2$(EXE)
	cp src/mk_consang $(DESTDIR)/gw/mk_consang$(EXE)
	cp src/mk_consang $(DESTDIR)/gw/consang$(EXE)
	cp src/gwd $(DESTDIR)/gw/gwd$(EXE)
	cp src/gwu $(DESTDIR)/gw/gwu$(EXE)
	cp src/update_nldb $(DESTDIR)/gw/update_nldb$(EXE)
	cp ged2gwb/ged2gwb $(DESTDIR)/gw/ged2gwb$(EXE)
	cp ged2gwb/ged2gwb2 $(DESTDIR)/gw/ged2gwb2$(EXE)
	cp gwb2ged/gwb2ged $(DESTDIR)/gw/gwb2ged$(EXE)
	cp setup/setup $(DESTDIR)/gw/gwsetup$(EXE)
	mkdir $(DESTDIR)/gw/gwtp_tmp
	mkdir $(DESTDIR)/gw/gwtp_tmp/lang
	cp gwtp/README $(DESTDIR)/gw/gwtp_tmp/.
	cp gwtp/gwtp $(DESTDIR)/gw/gwtp_tmp/gwtp$(EXE)
	cp gwtp/lang/*.txt $(DESTDIR)/gw/gwtp_tmp/lang/.
	mkdir $(DESTDIR)/gw/setup
	cp setup/intro.txt $(DESTDIR)/gw/setup/.
	mkdir $(DESTDIR)/gw/setup/lang
	if test $(OS_TYPE) = "Win"; then \
	  cp setup/lang/intro.txt.dos $(DESTDIR)/gw/setup/lang/intro.txt; \
	else \
	  cp setup/lang/intro.txt $(DESTDIR)/gw/setup/lang/intro.txt; \
	fi
	cp setup/lang/*.htm $(DESTDIR)/gw/setup/lang/.
	cp setup/lang/lexicon.txt $(DESTDIR)/gw/setup/lang/.
	cp -R hd/* $(DESTDIR)/gw/.

.merlin:
	echo "PKG $(PACKAGES)" > $@
	$(foreach target,$(ALL_TARGETS) $(EVERYTHING_TARGETS),printf "S $(target)\nB $(target)\n" >> $@$(\n))
