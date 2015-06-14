#include "./Math.h"
#include "./Txt.h"
#include <iomanip>

int Math::identify(std::string infix, int index)
{
}

double Math::evaluateRPN(std::string rpn, double x, bool verbose)
{
	std::vector<double> stk;
	Math::currentNum = std::string();
	double num1, num2;
	for(unsigned int c = 0; c < rpn.size(); c++)
	{
		switch(rpn[c])
		{
			case '+':
				if(rpn[c-1] == 'e' || rpn[c-1] == 'E')
				{
					Math::currentNum += rpn[c];
					break;
				}
				if(stk.size() > 0)
				{
					num2 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(stk.size() > 0)
				{
					num1 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				stk.push_back(num1 + num2);
				break;
			case '-':
				if(rpn[c-1] == 'e' || rpn[c-1] == 'E')
				{
					Math::currentNum += rpn[c];
					break;
				}
				if(stk.size() > 0)
				{
					num2 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(stk.size() > 0)
				{
					num1 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				stk.push_back(num1 - num2);
				break;
			case '*':
				if(stk.size() > 0)
				{
					num2 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(stk.size() > 0)
				{
					num1 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				stk.push_back(num1 * num2);
				break;
			case '/':
				if(stk.size() > 0)
				{
					num2 = stk.back();
					if(num2 == 0.0)
					{
						if(verbose) {printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str()); printf("NaN: Dividing by 0\n");}
						return 0.0;
					}
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(stk.size() > 0)
				{
					num1 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				stk.push_back(num1 / num2);
				break;
			case '^':
				if(stk.size() > 0)
				{
					num2 = stk.back();
					stk.pop_back();
				}
				else
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(stk.size() > 0)
				{
					num1 = stk.back();
					stk.pop_back();
				}
				else 
				{
					printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
					printf("ERROR: Invalid equation form. Stack size is 0.\n");
					return 0.0;
				}
				if(num1 >= 0 || std::floor(num2) == num2)
					stk.push_back(pow(num1,num2));
//				else stk.push_back(-2 * creal(cpow(num1,num2)));
				else stk.push_back(Math::exponential(num1,num2,verbose));
				break;
			case ' ':
				if(containsTrig(Math::currentNum)||containsLog(Math::currentNum)||containsFunction(Math::currentNum))
				{
					if(Math::currentNum == "sin")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(sin(num1));
					}
					else if(Math::currentNum == "cos")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(cos(num1));
					}
					else if(Math::currentNum == "tan")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(tan(num1));
					}
					else if(Math::currentNum == "asin")
					{
						num1 = stk.back();
						if(absolute(num1) > 1)
						{
							if(verbose) 
							{
								printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
								printf("Invalid range for asin\n");
							}
							return 0.0;
						}
						stk.pop_back();
						stk.push_back(asin(num1));
					}
					else if(Math::currentNum == "acos")
					{
						num1 = stk.back();
						if(absolute(num1) > 1)
						{
							if(verbose) 
							{
								printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
								printf("Invalid range for acos\n");
							}
							return 0.0;
						}
						stk.pop_back();
						stk.push_back(acos(num1));
					}
					else if(Math::currentNum == "atan")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(atan(num1));
					}
					else if(Math::currentNum == "abs")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(Math::absolute(num1));
					}
					else if(Math::currentNum == "sqrt")
					{
						num1 = stk.back();
						stk.pop_back();
						stk.push_back(pow(num1,0.5));
					}
					else if(Math::currentNum == "ln")
					{
						num1 = stk.back();
						if(num1 <= 0)
						{
							if(verbose) 
							{
								printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
								printf("Invalid argument for ln\n");
							}
							return 0.0;
						}
						stk.pop_back();
						stk.push_back(log(num1));
					}
					else if(Math::currentNum == "log")
					{
						num1 = stk.back();
						if(num1 <= 0)
						{
							if(verbose) 
							{
								printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
								printf("Invalid argument for log\n");
							}
							return 0.0;
						}
						stk.pop_back();
						double num = log(num1) / log(10);
						stk.push_back(num);
					}
					else 
					{
						printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
						printf("Function not found\n");
					}
				}
				else
				{
					try
					{
						if(Math::currentNum == " " || Math::currentNum == "") continue;
						int i;
						double val;
						if((i = Txt::contains(Math::currentNum, 'e')) != -1)
						{
							if(i == 0) val = M_E; //TEMPORARY, CHANGE WHEN RPN MODE IS ACTIVATED	
							else 
							{
//								val=atof(Txt::trimEnd(Txt::substring(Math::currentNum,0,i)).c_str())*pow(10,atof(Txt::trimFront(Txt::substring(Math::currentNum,i+1,Math::currentNum.size())).c_str()));
//								printf("CURRENT NUM: %s\n",Math::currentNum.c_str());
								std::stringstream s(Math::currentNum);
								s >> val >> val;
							}
						}
						if(Math::currentNum == "x"||Math::currentNum == "t") 
						{
							stk.push_back(x);
							Math::currentNum = std::string();
							break;
						}
						else if(Math::currentNum == "_x"||Math::currentNum == "_t")
						{
							stk.push_back(-x);
							Math::currentNum = std::string();
							break;
						}
						bool negative = isNegative(Math::currentNum);
						while(Math::currentNum[0] == '_')
						{
							Math::currentNum.erase(Math::currentNum.begin());
						}
						if(negative)
						{
							stk.push_back(-1 * atof(Math::currentNum.c_str()));
						}
						else stk.push_back(atof(Math::currentNum.c_str()));
					}
					catch(int e)
					{
						printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
						printf("Invalid equation.\nException %d has been thrown\n",e);
						return 0.0;
					}
				}
				Math::currentNum = std::string();
				break;
			default:
				Math::currentNum += rpn[c];
				break;
		}
	}
	double num = stk.back();
	stk.pop_back();
	stk.clear();

	if(verbose)
	{
		if(Math::absolute(num) < 0.001 || Math::absolute(num) > 1000000) printf("= %6e\n",num);
		else printf("= %f\n", num);
	}
	return num;
}

std::string Math::infixToRPN(std::string infix)
{
	Math::rpn << "";
	Math::stack.clear();
	Math::currentNum = "";
	bool negative = false;

	for (unsigned int c = 0; c < infix.size(); c++)
    	{
        	if (c == infix.size() - 1 && infix[c] != ')')
        	{
			char end[2] = { infix[c], '\0' };
			Math::currentNum.append(end);
			Math::appendCurrentNumber(negative);
			for (int j = Math::stack.size() - 1; j >= 0; j--)
			{
				if (Math::stack[j] != "(") Math::rpn <<  Math::stack[j] << " ";
				Math::stack.pop_back();
			}
        	}

        	switch (infix[c])
        	{
			case '(':
				Math::appendCurrentNumber(negative);
				Math::stack.push_back("(");
				break;
			case ')':
				Math::appendCurrentNumber(negative);
				for (int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if (Math::stack[j] != "(") Math::rpn <<  Math::stack[j] << " ";
					else{
						Math::stack.pop_back();
						break;
					}
					Math::stack.pop_back();
				}
				break;
			case '^':
				Math::appendCurrentNumber(negative);
				negative = false;
				for(int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if(Math::stack[j] == "(") break;
					if(Math::containsFunction(stack[j])||Math::containsTrig(stack[j])||Math::containsLog(stack[j])||Math::stack[j] == "^")
					{
						Math::rpn <<  Math::stack[j] << " ";
						if(j == Math::stack[j].size() - 1) Math::stack.pop_back();
						else Math::stack.erase(Math::stack.begin() + j);
					}
				}
				Math::stack.push_back("^");
				break;
			case '*':
				Math::appendCurrentNumber(negative);
				negative = false;
				for (int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if (Math::stack[j] == "(") break;
					if (Math::stack[j]=="^"||Math::stack[j]=="*"||Math::stack[j]=="/"||Math::containsFunction(stack[j])||Math::containsTrig(stack[j])||Math::containsLog(stack[j]))
					{
						Math::rpn <<  Math::stack[j] << " ";
						if (j == Math::stack.size() - 1) Math::stack.pop_back();
						else Math::stack.erase(Math::stack.begin() + j);
					}
				}
				Math::stack.push_back("*");
				break;
			case '/':
				Math::appendCurrentNumber(negative);
				negative = false;
				for (int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if (Math::stack[j] == "(") break;
					if (Math::stack[j] =="^"||Math::stack[j]=="/"||Math::stack[j]=="*"||Math::containsFunction(stack[j])||Math::containsTrig(stack[j])||Math::containsLog(stack[j]))
					{
						Math::rpn <<  Math::stack[j] << " ";
						if (j == Math::stack.size() - 1) Math::stack.pop_back();
						else Math::stack.erase(Math::stack.begin() + j);
					}
				}
				Math::stack.push_back("/");
				break;
			case '+':
				Math::appendCurrentNumber(negative);
				negative = false;
				for (int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if (Math::stack[j] == "(") break;
					if (Math::stack[j] == "^"||Math::stack[j] == "*"||Math::stack[j] == "/"||Math::stack[j] == "+"||Math::stack[j] == "-"||Math::containsFunction(stack[j])||Math::containsTrig(stack[j])||Math::containsLog(stack[j]))
					{
						Math::rpn << Math::stack[j] << " ";
						if (j == Math::stack.size() - 1) Math::stack.pop_back();
						else Math::stack.erase(Math::stack.begin() + j);
					}
				}
				Math::stack.push_back("+");
				break;
			case '-':
				if(c == 0)						//If the negative is the first character of the equation
				{
					negative = !negative;
					break;
				}
				else if(infix[c-1] == 'e' || infix[c-1] == 'E')	//If it's an exponent, add it to currentNum to be parsed later
				{
					Math::currentNum.push_back('-');
//					printf("ADDING THE MINUS SIGN");
					break;
				}
//				else printf("LAST CHAR: %c\n",rpn.str()[c-1]);
				if(isOperator(Math::lastChar(infix,c)) || lastChar(infix,c) == '(')
				{
					negative = !negative;
					break;
				}
				Math::appendCurrentNumber(negative);	//TODO Fix location of this.
				for (int j = Math::stack.size() - 1; j >= 0; j--)
				{
					if (Math::stack[j] == "(") break;
					if (Math::stack[j] == "^"|| Math::stack[j] == "*"|| Math::stack[j] == "/"|| Math::stack[j] == "+"||Math::stack[j] == "-"||Math::containsFunction(stack[j])||Math::containsTrig(stack[j])||Math::containsLog(stack[j]))
					{
						Math::rpn << Math::stack[j] << " ";
						if (j == Math::stack.size() - 1) Math::stack.pop_back();
						else Math::stack.erase(stack.begin() + j);
					}
				}
				Math::stack.push_back("-");
				break;
			default:
				if (infix[c] != ' ') Math::currentNum.push_back(infix[c]);
				break;
        	}
    	}
    	for (int c = Math::stack.size() - 1; c >= 0; c--)
    	{
		Math::rpn << Math::stack[c] << " ";
		Math::stack.pop_back();
    	}
//    	printf("%s\n", Math::rpn.str().c_str()); //TODO Turn on rpn printing
	return Math::rpn.str();
}

char Math::lastChar(const std::string s, int currentIndex)
{
	for(int c = currentIndex - 1; c >= 0; c--)
	{
		if(s[c] != ' ' && s[c] != '\t' && s[c] != '\n') return s[c];
	}
	return (char)NULL;
}

int Math::isVariable(std::string s)
{
	int c;
	for(c = 0; c < Math::variables.size(); c++)
	{
		if(Math::variables[c]->getName().compare(s) == 0)
		{
			return c;
		}
	}
	return -1;
}

double Math::exponential(double base, double exponent, bool verbose)
{
	double multiplier = -1.0f;
	if(base >= 0.0) return pow(base,exponent);
	if(std::floor(exponent) == exponent) return pow(base,exponent);
	double n,d;
	for(d = exponent; d > 1.0; d -= 1.0);
	for(; d < 1.0; d *= 2.0);
	for(n = 1/exponent; n > 2.0; n -= 2.0);
//	for(; n < 1.0; n *= 2.0);
	if(std::floor(d) == d) 
	{
		if(verbose)
		{
			printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
			printf("Indeterminate exponent\n");
		}
		return 0.0;
	}
	if(std::floor(n) == n)
	{
		if((int)n % 2 == 0) multiplier = 1.0f;	
	}
	else
	{
		if(std::floor(n * EXP_EVEN_NUMERATOR) == n * EXP_EVEN_NUMERATOR) multiplier = 1.0f;
	}

	return multiplier * pow(Math::absolute(base),exponent);
}

double Math::absolute(double num)
{
	if(num >= 0) return num;
	return -1 * num;
}

bool Math::isNegative(std::string current)
{
	int i;
	for(i = 0; i < current.size() && current[i] == '_'; i++);
	return (i % 2 != 0);
}

void Math::appendCurrentNumber(bool negative)
{
	if (Math::currentNum != "")
	{
		/*FUNCTIONS*/
		if(Math::containsFunction(Math::currentNum)||Math::containsTrig(Math::currentNum)||Math::containsLog(Math::currentNum))
		{
			Math::stack.push_back(Math::currentNum);
		}
		/*CONSTANTS AND NUMBERS*/
		else
		{
			int c;
			if(negative) 				Math::rpn << "_";
			if (Math::currentNum == "e")		Math::rpn << std::setprecision(12) << M_E << " ";
			else if (Math::currentNum == "pi")    	Math::rpn << std::setprecision(12) << M_PI << " ";
			else if ((c=isVariable(Math::currentNum))!= -1) 			
			{
				if(Math::variables[c]->getValue() >= 0) Math::rpn << std::setprecision(12) << Math::variables[c]->getValue() << " ";
				else Math::rpn << "_" << std::setprecision(12) << -1 * Math::variables[c]->getValue() << " ";
			}
			else                            	Math::rpn << Math::currentNum << " ";
//			printf("CURRENT NUM FROM APPEND: %s\n",Math::currentNum.c_str());
			negative = false;
		}
		currentNum.clear();
	}
}

void Math::setVariables(std::vector<Variable *> var)
{
	Math::variables = var;
	for(int c = 0; c < Math::variables.size(); c++)
	{
		if(Math::variables[c]->getName() == "ans")
		{
			Math::ANS = c;
			break;
		}
	}
}

std::string Math::Math::currentNum = "";
std::stringstream Math::Math::rpn;
std::vector<std::string> Math::stack;
std::vector<Variable *> Math::variables;
std::vector<std::string> Math::insults;
std::string Math::colorNames[4];
int Math::colorValues[4];
int Math::ANS;
